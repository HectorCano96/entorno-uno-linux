#!/bin/bash
# Hace que el script termine inmediatamente si un comando falla.
set -e

# ==============================================================================
# INSTALADOR DE ENTORNO DE DESARROLLO
#
# Este script instala y configura un entorno de desarrollo completo con
# herramientas comunes para DevOps, Cloud y desarrollo en general.
# Es idempotente, lo que significa que se puede ejecutar múltiples veces
# sin causar problemas, ya que comprueba si una herramienta ya existe
# antes de intentar instalarla.
# ==============================================================================

echo "Iniciando la configuración del entorno de desarrollo..."

# --- Parte 0: Preparación del Sistema ---
echo "Preparando el sistema base..."

# Suprime el warning de apt-get en Cloud Shell
mkdir -p "$HOME/.cloudshell"
touch "$HOME/.cloudshell/no-apt-get-warning"

# Restaura el sistema a su estado completo si no se ha hecho en esta sesión
UNMINIMIZE_FLAG="/tmp/.unminimize_complete.$(whoami)"
if [ ! -f "$UNMINIMIZE_FLAG" ]; then
    echo "Restaurando paquetes y documentación del sistema (operación única para esta sesión)..."

    # Preparamos el terreno para 'unminimize' creando el archivo que espera.
    # Esto es para compatibilidad con imágenes de SO más nuevas donde este archivo no existe.
    echo "Creando archivo de compatibilidad para unminimize..."
    sudo mkdir -p /etc/dpkg/dpkg.cfg.d
    sudo touch /etc/dpkg/dpkg.cfg.d/excludes

    yes | DEBIAN_FRONTEND=noninteractive sudo unminimize -f
    echo "Sistema restaurado."
    touch "$UNMINIMIZE_FLAG"
else
    echo "El sistema ya fue restaurado en esta sesión. Omitiendo."
fi

# --- Parte 1: Configuración de Repositorios Externos ---
echo "Configurando repositorios de software externos..."

# Repositorio de Terraform
if ! command -v terraform &> /dev/null; then
    echo "Agregando repositorio de HashiCorp (Terraform)..."
    sudo apt-get install -y wget gnupg lsb-release
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
fi

# Repositorio de Helm
if ! command -v helm &> /dev/null; then
    echo "Agregando repositorio de Helm..."
    curl -s https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
fi

# Repositorio de Kubectl
if ! command -v kubectl &> /dev/null; then
    echo "Agregando repositorio de Kubernetes (kubectl)..."
    sudo apt-get install -y apt-transport-https ca-certificates curl
    # Se obtiene la última versión estable de k8s dinámicamente.
    K8S_STABLE_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
    sudo curl -fsSL "https://pkgs.k8s.io/core:/stable:/${K8S_STABLE_VERSION}/deb/Release.key" | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/${K8S_STABLE_VERSION}/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
fi

# --- Parte 2: Instalación de Paquetes APT ---
echo "Actualizando e instalando paquetes base vía APT..."
sudo apt-get update

# Paquetes estándar
sudo apt-get install -y \
    apt-utils \
    build-essential man-db tldr htop net-tools dnsutils plocate tree zip unzip wget \
    tmux zsh fish fzf ripgrep jq bat vim emacs nmap iotop sysstat ansible \
    docker-compose postgresql-client mysql-client redis-tools mongodb-mongosh \
    python3-pip eza zoxide

# Paquetes de repositorios externos
if ! command -v terraform &> /dev/null; then sudo apt-get install -y terraform; fi
if ! command -v helm &> /dev/null; then sudo apt-get install -y helm; fi
if ! command -v kubectl &> /dev/null; then sudo apt-get install -y kubectl; fi

# --- Parte 3: Instalación de Otras Herramientas ---
echo "Instalando herramientas adicionales (CLIs de Cloud y otros)..."

# Azure CLI
if ! command -v az &> /dev/null; then
    echo "Instalando Azure CLI..."
    curl -sL https://aka.ms/InstallAzureCLIDeb | DEBIAN_FRONTEND=noninteractive sudo bash
fi

# AWS CLI
if ! command -v aws &> /dev/null; then
    echo "Instalando AWS CLI..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip -q awscliv2.zip
    sudo ./aws/install
    rm -rf aws awscliv2.zip
fi

# ctop
if ! command -v ctop &> /dev/null; then
    echo "Instalando ctop..."
    # Se obtiene la última versión desde la API de GitHub.
    CTOP_LATEST_URL=$(curl -sL "https://api.github.com/repos/bcicen/ctop/releases/latest" | jq -r '.assets[] | select(.name | endswith("linux-amd64")) | .browser_download_url')
    sudo wget "$CTOP_LATEST_URL" -O /usr/local/bin/ctop
    sudo chmod +x /usr/local/bin/ctop
fi

# dive
if ! command -v dive &> /dev/null; then
    echo "Instalando dive..."
    # Se usa jq para extraer y limpiar el número de versión de forma robusta.
    DIVE_VERSION=$(curl -sL "https://api.github.com/repos/wagoodman/dive/releases/latest" | jq -r '.tag_name | sub("v"; "")')
    curl -L -o dive.deb "https://github.com/wagoodman/dive/releases/latest/download/dive_${DIVE_VERSION}_linux_amd64.deb"
    sudo apt install -y ./dive.deb
    rm dive.deb
fi

# starship - El prompt de shell personalizable
if ! command -v starship &> /dev/null; then
    echo "Instalando starship prompt..."
    curl -sS https://starship.rs/install.sh | sudo sh -s -- -y
fi

# --- Parte 4: Configuración de Node.js con NVM ---
# Se instala Node.js usando NVM (Node Version Manager) para asegurar que se
# utiliza la versión más reciente y estable (LTS), evitando conflictos con
# las versiones antiguas de los repositorios de sistema.

echo "Instalando la última versión LTS de Node.js a través de NVM..."

export NVM_DIR="$HOME/.nvm"
# Instalar NVM (si no está ya instalado)
if [ ! -s "$NVM_DIR/nvm.sh" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

# Cargar NVM en la sesión actual del script para poder usarlo
\. "$NVM_DIR/nvm.sh"

# Instalar y usar la versión LTS más reciente de Node.js
nvm install --lts
nvm use --lts
nvm alias default lts/*

echo "Configuración del entorno de desarrollo finalizada."