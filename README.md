# 🚀 Entorno Uno: Tu Laboratorio de Desarrollo Linux en la Nube

<p align="center">
  <b>Un script para transformar una terminal de Linux básica en un entorno de desarrollo completo, versátil y listo para usar.</b>
</p>

<p align="center">
  <!-- Nota para ti: Puedes activar estos badges reemplazando los placeholders o usando servicios como shields.io -->
  <img src="https://img.shields.io/github/license/HectorCano96/entorno-uno-linux?style=for-the-badge" alt="Licencia">
  <img src="https://img.shields.io/github/last-commit/HectorCano96/entorno-uno-linux?style=for-the-badge" alt="Último Commit">
  <img src="https://img.shields.io/badge/Mantenido-SÍ-green?style=for-the-badge" alt="Mantenido">
</p>

---

### 💡 Mi Viaje: El "Porqué" de este Proyecto

Soy economista de formación. Durante mucho tiempo, mi mundo giraba en torno a modelos econométricos, análisis de políticas y hojas de cálculo. Sin embargo, la curiosidad por la tecnología y la necesidad de herramientas más potentes me llevaron a un viaje de autodescubrimiento en el vasto universo del desarrollo de software. Como muchos que venimos de campos no tecnológicos, este camino ha estado lleno de desafíos: la intimidante tarea de configurar máquinas virtuales, el temor a particionar un disco duro o, simplemente, la parálisis de no saber por dónde empezar.

Este repositorio es la manifestación de esa lucha y, a la vez, mi solución personal. Es mi **"Entorno Uno"**, un laboratorio de desarrollo que construí para consolidar mi aprendizaje durante el programa de Ciencia de Datos y el Tech Advance de Oracle y Alura. Lo comparto con una misión clara: **ayudar a cualquiera que se sienta perdido en la configuración de su entorno de desarrollo.**

Está pensado para el estudiante, el profesional en transición o el curioso que, como yo, necesita un espacio seguro, preconfigurado y potente para experimentar, aprender y crecer sin el riesgo de comprometer su computador personal. El objetivo es que puedas tener un entorno de desarrollo de nivel profesional, accesible desde cualquier navegador, con un solo comando.

> **Un Agradecimiento Especial:**
> Quiero extender un agradecimiento profundo a toda la comunidad que se encuentra tras la construcción de herramientas tan poderosas como Gemini y todo el ecosistema de código abierto. Gracias por brindarnos luz y compañía en este camino que a menudo puede ser lleno de incertidumbre y soledad. Su trabajo nos empodera para seguir aprendiendo.

---

### 🛠️ Quick Start: Instalación Inmediata

Para poner en marcha tu entorno, simplemente clona este repositorio y ejecuta los scripts. El proceso es **idempotente**, lo que significa que puedes ejecutarlo cuantas veces quieras sin temor a romper nada.

```bash
# 1. Clona el repositorio en tu directorio de preferencia
git clone https://github.com/HectorCano96/entorno-uno-linux.git ~/entorno-uno-linux

# 2. Navega al directorio recién creado
cd ~/entorno-uno-linux

# 3. Ejecuta el script principal que instala todas las herramientas
# Este paso puede tardar varios minutos, ¡ten paciencia!
./setup_dev_tools.sh

# 4. (Opcional pero recomendado) Instala la configuración de la terminal para una mejor experiencia
./install.sh

# 5. ¡Listo! Recarga tu terminal para que todos los cambios surtan efecto
source ~/.bashrc
```

---

### 🧰 La Caja de Herramientas: Componentes y Guía de Uso

Este no es solo un conjunto de paquetes; es un ecosistema de herramientas seleccionadas para colaborar entre sí. Aquí tienes una guía detallada de cada una.

#### 1. La Base del Sistema 튼튼

| Herramienta | Descripción Detallada | Comandos y Guía de Uso | Documentación |
| :--- | :--- | :--- | :--- |
| ⚙️ **Build Essential** | Es el kit de construcción fundamental. Instala el compilador de C/C++ (GCC) y librerías esenciales. Sin esto, muchos otros programas (especialmente los que se compilan desde código fuente) no podrían instalarse. Es el cimiento invisible de tu entorno. | No tiene comandos directos. Es una dependencia que simplemente debe estar ahí. | [Detalles](https://packages.ubuntu.com/focal/build-essential) |
| 📖 **tldr & man-db** | `man` es el manual tradicional de Linux, exhaustivo pero denso. `tldr` (Too Long; Didn't Read) es su complemento perfecto: te da ejemplos prácticos y directos de los comandos más comunes. | `man git` (Lee el manual completo de Git).<br>`tldr git` (Ve ejemplos de uso de Git como `git commit`). | [tldr pages](https://tldr.sh/) |
| 🩺 **htop / iotop / sysstat** | Son tus instrumentos de diagnóstico. `htop` te da una vista interactiva de los procesos y el consumo de CPU/RAM. `iotop` te muestra qué procesos están leyendo o escribiendo en el disco. `sysstat` es una suite para monitorear el rendimiento a lo largo del tiempo. | `htop` (Inicia el monitor de procesos).<br>`sudo iotop` (Observa el uso del disco en tiempo real). | [htop](https://htop.dev/) |

#### 2. Productividad en la Terminal ✨

| Herramienta | Descripción Detallada | Comandos y Guía de Uso | Documentación |
| :--- | :--- | :--- | :--- |
| 🌟 **Starship** | Mejora radicalmente la apariencia de tu terminal. Es un "prompt" que te da información contextual al instante: en qué rama de Git estás, qué versión de Node usas, si un comando anterior falló, etc. Es rápido y personalizable. | `starship preset` (Explora configuraciones predefinidas).<br>El script ya lo configura por defecto. | [Starship](https://starship.rs/) |
| 🐠 **zsh / fish** | Son "shells" o intérpretes de comandos más modernos y potentes que el `bash` tradicional. Ofrecen autocompletado inteligente, sugerencias basadas en tu historial y una sintaxis más amigable. Te ayudan a escribir comandos más rápido y con menos errores. | `zsh` (Inicia la shell Zsh).<br>`fish` (Inicia la shell Fish). | [Oh My Zsh](https://ohmyz.sh/)<br>[Fish Shell](https://fishshell.com/) |
|  multiplexor de terminal. Te permite tener múltiples "ventanas" y "paneles" dentro de una sola terminal. Su superpoder es que puedes desconectarte de la sesión y tus programas seguirán corriendo en segundo plano. | `tmux new -s mi_sesion` (Crea una sesión nueva llamada "mi_sesion").<br>`Ctrl+b, d` (Te desconectas de la sesión actual sin cerrarla).<br>`tmux attach -t mi_sesion` (Vuelves a conectarte a la sesión). | [Wiki](https://github.com/tmux/tmux/wiki) |
| 🔍 **fzf** | Es un buscador "fuzzy" (difuso) ultra rápido para la línea de comandos. Se integra con tu historial (`Ctrl+R`) y te permite encontrar archivos (`Ctrl+T`) de forma interactiva y visual. | `Ctrl+R` (Busca interactivamente en tu historial de comandos).<br>`ls -R \| fzf` (Busca un archivo en el listado de todos los archivos del directorio actual). | [GitHub](https://github.com/junegunn/fzf) |
| 🦇 **bat** | Es un `cat` con superpoderes. Muestra el contenido de archivos con resaltado de sintaxis (colores según el lenguaje), numeración de líneas e integración con Git para ver los cambios. Hace que leer código en la terminal sea un placer. | `bat mi_script.py` (Muestra el archivo Python con colores).<br>`bat -l` (Lista los lenguajes soportados). | [GitHub](https://github.com/sharkdp/bat) |
| 🧬 **jq** | Es el `sed` o `awk` para JSON. Una herramienta indispensable para manipular datos en formato JSON desde la terminal. Te permite filtrar, transformar y extraer información de la salida de APIs o archivos de configuración. | `cat datos.json \| jq '.campo[0].nombre'` (Extrae el campo 'nombre' del primer objeto en el array 'campo'). | [Página Oficial](https://jqlang.github.io/jq/) |

#### 3. Desarrollo de Software 💻

| Herramienta | Descripción Detallada | Comandos y Guía de Uso | Documentación |
| :--- | :--- | :--- | :--- |
| 🟢 **NVM & Node.js** | **NVM (Node Version Manager)** es crucial para cualquier desarrollador de JavaScript. Te permite instalar y cambiar entre múltiples versiones de Node.js fácilmente, evitando conflictos. El script instala la última versión LTS (Long-Term Support) de **Node.js**, el entorno para ejecutar JavaScript fuera del navegador. | `nvm ls` (Lista todas las versiones de Node instaladas).<br>`nvm install 18` (Instala la versión 18 de Node).<br>`nvm use 18` (Cambia a la versión 18 para la sesión actual).<br>`nvm alias default 18` (Establece la v18 como la predeterminada). | [NVM](https://github.com/nvm-sh/nvm) |
| 🐍 **Python & Pip** | Python es un lenguaje clave para ciencia de datos, desarrollo web (Django, Flask) y scripting. El script asegura que tengas **Python 3** y **Pip**, su gestor de paquetes, que te permite instalar miles de librerías como `pandas`, `numpy` o `requests`. | `python3 --version` (Verifica la versión instalada).<br>`pip3 install numpy pandas` (Instala las librerías numpy y pandas).<br>`python3 -m venv mi_entorno` (Crea un entorno virtual para tu proyecto). | [Python](https://www.python.org/) |

#### 4. Cloud, DevOps y Contenedores ☁️

| Herramienta | Descripción Detallada | Comandos y Guía de Uso | Documentación |
| :--- | :--- | :--- | :--- |
| 🐳 **Docker & Compose** | **Docker** te permite empaquetar aplicaciones y sus dependencias en "contenedores" aislados y portátiles. **Docker Compose** es su director de orquesta, permitiéndote definir y ejecutar aplicaciones compuestas por múltiples contenedores (ej. una API, una base de datos y un frontend) con un solo archivo (`docker-compose.yml`). | `docker run hello-world` (Verifica que Docker funciona).<br>`docker ps` (Lista los contenedores en ejecución).<br>`docker-compose up -d` (Levanta los servicios definidos en `docker-compose.yml` en segundo plano). | [Docker](https://docs.docker.com/) |
| 🏗️ **Terraform** | Es la herramienta estándar para la "Infraestructura como Código" (IaC). Te permite definir la infraestructura de nube (servidores, bases de datos, redes) en archivos de texto declarativos. Esto hace que tu infraestructura sea versionable, repetible y fácil de gestionar. | `terraform init` (Inicializa un proyecto de Terraform, descargando proveedores).<br>`terraform plan` (Muestra los cambios que se aplicarán en la infraestructura).<br>`terraform apply` (Aplica los cambios para crear o modificar la infraestructura). | [Documentación](https://developer.hashicorp.com/terraform/docs) |
| ☸️ **Kubectl & Helm** | **Kubectl** es la navaja suiza para interactuar con clústeres de Kubernetes, el orquestador de contenedores líder. **Helm** es el "gestor de paquetes" de Kubernetes; simplifica enormemente la instalación y gestión de aplicaciones complejas (como una base de datos o un sistema de monitoreo) en un clúster. | `kubectl get pods -n <namespace>` (Obtiene el estado de los pods en un namespace).<br`helm install mi-redis bitnami/redis` (Instala un chart de Redis desde el repositorio de Bitnami). | [Kubectl](https://kubernetes.io/docs/reference/kubectl/)<br>[Helm](https://helm.sh/docs/) |
| 🇦 **AWS & Azure CLI** | Son las Interfaces de Línea de Comandos (CLI) oficiales para gestionar tus recursos en Amazon Web Services y Microsoft Azure, respectivamente. Te permiten automatizar tareas, crear scripts y controlar tus servicios en la nube sin usar la interfaz web. | `aws s3 ls` (Lista tus buckets de S3 en AWS).<br>`az group list --output table` (Muestra tus grupos de recursos de Azure en una tabla). | [AWS CLI](https://aws.amazon.com/cli/)<br>[Azure CLI](https://docs.microsoft.com/en-us/cli/azure/) |

---

### 🤝 Comunidad y Colaboración

Este proyecto es un ente vivo, que evoluciona con mi aprendizaje y, espero, con el de la comunidad. Estás más que invitado a usarlo, modificarlo y, si lo deseas, contribuir.

La retroalimentación constructiva es el motor del código abierto. Si encuentras un error, tienes una idea para una nueva herramienta o quieres proponer una mejora, por favor, abre un **Issue** o un **Pull Request**. ¡Toda ayuda es bienvenida!

### 📜 Licencia

Este proyecto se distribuye bajo la **Licencia MIT**. Eres libre de usar, modificar y distribuir este código como mejor te parezca.
