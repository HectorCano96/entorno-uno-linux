#!/bin/bash
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
mkdir -p /home/hcano_personal/.cloudshell
touch /home/hcano_personal/.cloudshell/no-apt-get-warning

# Restaura el sistema a su estado completo si no se ha hecho antes
if [ ! -f "/home/hcano_personal/.unminimize_complete" ]; then
    echo "Restaurando paquetes y documentación del sistema (operación única)..."
    DEBIAN_FRONTEND=noninteractive sudo unminimize -f
    echo "Sistema restaurado."
    touch "/home/hcano_personal/.unminimize_complete"
else
    echo "El sistema ya está completo. Omitiendo."
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
    sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
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
    python3-pip nodejs eza zoxide

# Paquetes de repositorios externos
if ! command -v terraform &> /dev/null; then sudo apt-get install -y terraform; fi
if ! command -v helm &> /dev/null; then sudo apt-get install -y helm; fi
if ! command -v kubectl &> /dev/null; then sudo apt-get install -y kubectl; fi

# --- Parte 3: Instalación de Otras Herramientas ---
echo "Instalando herramientas adicionales (CLIs de Cloud y otros)..."

# Azure CLI
if ! command -v az &> /dev/null; then
    echo "Instalando Azure CLI..."
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
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
    sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.7/ctop-0.7.7-linux-amd64 -O /usr/local/bin/ctop
    sudo chmod +x /usr/local/bin/ctop
fi

# dive
if ! command -v dive &> /dev/null; then
    echo "Instalando dive..."
    DIVE_VERSION=$(curl -sL "https://api.github.com/repos/wagoodman/dive/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^\"]+)".*/\1/')
    curl -L -o dive.deb "https://github.com/wagoodman/dive/releases/latest/download/dive_${DIVE_VERSION}_linux_amd64.deb"
    sudo apt install -y ./dive.deb
    rm dive.deb
fi

# starship - El prompt de shell personalizable
if ! command -v starship &> /dev/null; then
    echo "Instalando starship prompt..."
    curl -sS https://starship.rs/install.sh | sudo sh -s -- -y
fi

echo "Configuración del entorno de desarrollo finalizada."

