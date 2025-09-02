# Entorno Uno: Laboratorio de Desarrollo Linux en la Nube

Un script para transformar una terminal de Linux básica en un entorno de desarrollo completo, versátil y listo para usar.

---

### Resumen

Este proyecto proporciona un conjunto de scripts para automatizar la instalación y configuración de un entorno de desarrollo integral en cualquier máquina Linux, con un enfoque especial en plataformas en la nube como **Google Cloud Shell**.

El objetivo es simple: **eliminar la fricción de la configuración inicial** y permitir a los desarrolladores, estudiantes y profesionales en transición tecnológica enfocarse en lo que realmente importa: aprender, programar y construir.

### Quick Start: Instalación Inmediata

Para poner en marcha tu entorno, clona este repositorio y ejecuta los scripts.

```bash
# 1. Clona el repositorio
git clone https://github.com/HectorCano96/entorno-uno-linux.git ~/entorno-uno-linux

# 2. Entra al directorio
cd ~/entorno-uno-linux

# 3. Ejecuta el script principal de instalación de herramientas
# (El script es idempotente, puedes ejecutarlo varias veces sin problemas)
./setup_dev_tools.sh

# 4. (Opcional) Instala la configuración de la terminal para una mejor experiencia
./install.sh

# 5. Recarga tu terminal para aplicar todos los cambios
source ~/.bashrc
```

### La Caja de Herramientas: Componentes Incluidos

Este entorno instala un ecosistema de herramientas cuidadosamente seleccionadas para cubrir las necesidades más comunes en desarrollo de software, DevOps y ciencia de datos.

#### 1. La Base del Sistema

| Herramienta | Descripción | Comandos Útiles | Documentación |
| :--- | :--- | :--- | :--- |
| **Build Essential** | Compiladores y librerías para instalar software desde código fuente. | N/A (Dependencia) | [Detalles](https://packages.ubuntu.com/focal/build-essential) |
| **tldr & man-db** | `man` para documentación exhaustiva y `tldr` para ejemplos prácticos. | `man git`<br>`tldr git` | [tldr pages](https://tldr.sh/) |
| **htop / iotop / sysstat** | Monitores de procesos, actividad de disco y rendimiento del sistema. | `htop`<br>`sudo iotop` | [htop](https://htop.dev/) |
| **net-tools / dnsutils** | Utilidades de red para diagnóstico (`ifconfig`, `dig`, `nslookup`). | `ifconfig`<br>`dig google.com` | N/A |

#### 2. Productividad en la Terminal

| Herramienta | Descripción | Comandos Útiles | Documentación |
| :--- | :--- | :--- | :--- |
| **Starship** | Prompt de terminal moderno que muestra contexto relevante (Git, Node, etc.). | `starship preset` | [Starship](https://starship.rs/) |
| **zsh / fish** | Shells modernos con autocompletado y sintaxis mejorados. | `zsh`<br>`fish` | [Oh My Zsh](https://ohmyz.sh/)<br>[Fish Shell](https://fishshell.com/) |
| **tmux** | Multiplexor de terminal para gestionar múltiples sesiones y paneles. | `tmux new -s <nombre>`<br>`Ctrl+b, d` (desconectar) | [Wiki](https://github.com/tmux/tmux/wiki) |
| **fzf** | Buscador "fuzzy" para encontrar archivos e historial de comandos. | `Ctrl+R` (historial)<br>`Ctrl+T` (archivos) | [GitHub](https://github.com/junegunn/fzf) |
| **ripgrep (`rg`)** | Alternativa a `grep` extremadamente rápida para buscar texto. | `rg "mi_variable"` | [GitHub](https://github.com/BurntSushi/ripgrep) |
| **eza** | Reemplazo moderno de `ls` con colores, iconos y vista de árbol. | `eza -l --icons`<br>`eza --tree` | [GitHub](https://github.com/eza-community/eza) |
| **zoxide** | Navegación de directorios inteligente que aprende de tu uso. | `z mi_proyecto`<br>`zi mi_proyecto` (interactivo) | [GitHub](https://github.com/ajeetdsouza/zoxide) |
| **bat** | Reemplazo de `cat` con resaltado de sintaxis y numeración. | `bat mi_script.py` | [GitHub](https://github.com/sharkdp/bat) |
| **jq** | Procesador de JSON para la línea de comandos, ideal para APIs. | `cat data.json \| jq '.campo'` | [Página Oficial](https://jqlang.github.io/jq/) |

#### 3. Desarrollo de Software

| Herramienta | Descripción | Comandos Útiles | Documentación |
| :--- | :--- | :--- | :--- |
| **NVM & Node.js** | **NVM** para gestionar versiones de **Node.js**. Instala la última LTS. | `nvm install --lts`<br>`nvm use <version>` | [NVM](https://github.com/nvm-sh/nvm)<br>[Node.js](https://nodejs.org/) |
| **Python & Pip** | Python 3 y su gestor de paquetes `pip` para librerías y aplicaciones. | `python3 -V`<br>`pip3 install <paquete>` | [Python](https://www.python.org/) |
| **Vim / Emacs** | Editores de texto potentes y configurables para la terminal. | `vim <archivo>`<br>`emacs <archivo>` | [Vim](https://www.vim.org/)<br>[Emacs](https://www.gnu.org/software/emacs/) |

#### 4. Cloud, DevOps y Contenedores

| Herramienta | Descripción | Comandos Útiles | Documentación |
| :--- | :--- | :--- | :--- |
| **Docker & Compose** | **Docker** para crear contenedores y **Compose** para orquestarlos. | `docker ps`<br>`docker-compose up` | [Docker](https://docs.docker.com/)<br>[Compose](https://docs.docker.com/compose/) |
| **ctop & dive** | `ctop` para monitorear contenedores y `dive` para analizar sus capas. | `ctop`<br>`dive <imagen>` | [ctop](https://github.com/bcicen/ctop)<br>[dive](https://github.com/wagoodman/dive) |
| **Terraform** | Herramienta de Infraestructura como Código (IaC) para provisionar recursos. | `terraform init`<br>`terraform apply` | [Documentación](https://developer.hashicorp.com/terraform/docs) |
| **Ansible** | Automatización de configuración de servidores y despliegue de software. | `ansible-playbook <playbook.yml>` | [Documentación](https://docs.ansible.com/) |
| **Kubectl & Helm** | **Kubectl** para gestionar clústeres de Kubernetes y **Helm** para empaquetar apps. | `kubectl get pods`<br`helm install <chart>` | [Kubectl](https://kubernetes.io/docs/reference/kubectl/)<br>[Helm](https://helm.sh/docs/) |
| **AWS CLI & Azure CLI** | CLIs oficiales para gestionar recursos en Amazon Web Services y Microsoft Azure. | `aws s3 ls`<br>`az group list` | [AWS CLI](https://aws.amazon.com/cli/)<br>[Azure CLI](https://docs.microsoft.com/en-us/cli/azure/) |

#### 5. Clientes de Bases de Datos

| Herramienta | Descripción | Comandos Útiles | Documentación |
| :--- | :--- | :--- | :--- |
| **PostgreSQL Client** | Cliente `psql` para interactuar con bases de datos PostgreSQL. | `psql -h <host> -U <user>` | [Documentación](https://www.postgresql.org/docs/current/app-psql.html) |
| **MySQL Client** | Cliente `mysql` para bases de datos MySQL y MariaDB. | `mysql -h <host> -u <user> -p` | [Documentación](https://dev.mysql.com/doc/refman/8.0/en/mysql.html) |
| **Redis Tools** | Incluye `redis-cli` para interactuar con servidores Redis. | `redis-cli -h <host> ping` | [redis-cli](https://redis.io/docs/ui/cli/) |
| **MongoDB Shell** | Shell interactiva `mongosh` para bases de datos MongoDB. | `mongosh "mongodb://<host>"` | [mongosh](https://www.mongodb.com/docs/mongodb-shell/) |

---

### Filosofía y Audiencia

Este proyecto nació de mi propia experiencia como economista en transición al mundo de la tecnología. El objetivo es ofrecer una solución a quienes, como yo, provienen de campos no tradicionales y desean un punto de partida sólido y sin complicaciones para su aprendizaje.

Está dirigido a:
*   **Estudiantes y autodidactas** que necesitan un entorno de desarrollo robusto sin el riesgo de alterar su sistema local.
*   **Profesionales** que usan herramientas como Cloud Shell y quieren personalizarlas para ser más productivos.
*   **Cualquiera** que valore un enfoque de "infraestructura como código" para su propio entorno de desarrollo.

Este repositorio es mi forma de contribuir a la comunidad, con un agradecimiento especial a los creadores de herramientas de código abierto que hacen posible nuestro crecimiento.

### Contribuciones

Las críticas constructivas y las contribuciones son bienvenidas. Si tienes ideas para mejorar el entorno, detectas un error o quieres añadir una nueva herramienta, por favor, abre un **Issue** o un **Pull Request**.

### Licencia

Este proyecto se distribuye bajo la **Licencia MIT**.