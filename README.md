# 🚀 Entorno Uno: Laboratorio de Desarrollo Linux en la Nube

<p align="center">
  <b>Un script para transformar una terminal de Linux básica en un entorno de desarrollo completo, versátil y listo para usar.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/github/license/HectorCano96/entorno-uno-linux?style=for-the-badge" alt="Licencia">
  <img src="https://img.shields.io/github/last-commit/HectorCano96/entorno-uno-linux?style=for-the-badge" alt="Último Commit">
  <img src="https://img.shields.io/badge/Mantenido-SÍ-green?style=for-the-badge" alt="Mantenido">
</p>

---

### 🎯 Resumen del Proyecto

Este repositorio contiene un conjunto de scripts diseñados para automatizar la instalación y configuración de un entorno de desarrollo integral. Está especialmente optimizado para plataformas en la nube como **Google Cloud Shell**, pero es compatible con cualquier máquina Linux basada en Debian/Ubuntu.

El objetivo es simple: **eliminar la fricción de la configuración inicial** y permitir a los desarrolladores, estudiantes y profesionales en transición tecnológica enfocarse en lo que realmente importa: aprender, programar y construir.

### 🛠️ Quick Start: Instalación

Para poner en marcha tu entorno, clona este repositorio y ejecuta los scripts. El proceso es **idempotente** (puedes ejecutarlo varias veces sin problemas).

```bash
# 1. Clona el repositorio en tu directorio de preferencia
git clone https://github.com/HectorCano96/entorno-uno-linux.git ~/entorno-uno-linux

# 2. Navega al directorio recién creado
cd ~/entorno-uno-linux

# 3. Ejecuta el script principal que instala todas las herramientas (puede tardar varios minutos)
./setup_dev_tools.sh

# 4. (Opcional pero recomendado) Instala la configuración de la terminal
./install.sh

# 5. ¡Listo! Recarga tu terminal para que todos los cambios surtan efecto
source ~/.bashrc
```

---

### 📂 Estructura del Repositorio

Para navegar este proyecto, es útil entender el propósito de cada archivo clave:

*   `setup_dev_tools.sh`: Es el corazón del proyecto. Este script se encarga de instalar todas las herramientas de software, CLIs, y gestores de paquetes. Es el script principal que aprovisiona el entorno.
*   `install.sh`: Este script se enfoca en la configuración del entorno de la terminal (shell). Crea enlaces simbólicos para archivos de configuración como `.bashrc`, permitiendo que tu terminal adopte la personalización definida en el repositorio.
*   `.bashrc`: Es el archivo de configuración para la shell Bash. En este proyecto, está personalizado para cargar herramientas como Starship y NVM, y para definir alias y funciones que agilizan el flujo de trabajo.

---

### 💡 Contexto y Objetivos del Proyecto

Este proyecto nació de una necesidad personal. Viniendo de una formación en **Economía**, un campo profundamente analítico, mi transición hacia la tecnología me presentó un desafío dual: no solo debía aprender a programar, sino también a construir y gestionar un entorno de desarrollo eficaz. Este repositorio es el resultado de esa jornada, consolidando el conocimiento adquirido en mi formación en **Ciencia de Datos** y, más recientemente, en el **Tech Advance Program de Oracle y Alura**, con un enfoque en **Oracle Cloud Infrastructure (OCI)**.

"Entorno Uno" es la solución estructurada a ese problema. Es un sistema de aprovisionamiento personal que busca ofrecer un atajo a otros que se encuentren en una situación similar. 

**El público objetivo es:**
*   **Estudiantes y autodidactas** que necesitan un entorno robusto sin el riesgo de alterar su sistema local.
*   **Profesionales en transición de carrera** que desean familiarizarse con las herramientas estándar de la industria.
*   **Desarrolladores experimentados** que valoran un enfoque de "infraestructura como código" para replicar su entorno de trabajo en cualquier máquina.

---

### 🧰 La Caja de Herramientas: Guía Detallada de Uso

A continuación se presenta un desglose detallado de las herramientas instaladas, su propósito y cómo empezar a utilizarlas.

(El resto de la guía de herramientas permanece igual...)

## I. Productividad en la Terminal

Herramientas diseñadas para hacer tu experiencia en la línea de comandos más rápida, eficiente y agradable.

### 🌟 Starship
*   **¿Qué es?** Un prompt de terminal minimalista, rápido e infinitamente personalizable.
*   **¿Por qué está aquí?** Reemplaza el prompt aburrido (`user@host:~$`) por uno inteligente que proporciona información contextual vital de un solo vistazo: la rama de Git en la que te encuentras, la versión de Node.js activa, si tu último comando falló, etc.
*   **Guía de Uso Práctico:** Starship se activa automáticamente. Su principal beneficio es la información pasiva que te brinda mientras trabajas. No requiere comandos activos en el día a día.
*   **Documentación Oficial:** [starship.rs](https://starship.rs/)

### 🐠 Zsh & Fish
*   **¿Qué es?** Shells (intérpretes de comandos) modernos y potentes que superan al `bash` tradicional.
*   **¿Por qué está aquí?** Ofrecen características que aceleran tu flujo de trabajo, como autocompletado avanzado (sugieren comandos mientras escribes basados en tu historial), corrección de sintaxis y una configuración más intuitiva. 
*   **Guía de Uso Práctico:**
    *   `zsh`: Para iniciar la shell Zsh en tu terminal actual.
    *   `fish`: Para iniciar la shell Fish. Una vez dentro, prueba a escribir un comando que ya usaste (como `git`) y verás cómo te sugiere el resto.
*   **Documentación Oficial:** [Oh My Zsh](https://ohmyz.sh/), [Fish Shell](https://fishshell.com/)

### 🪟 tmux
*   **¿Qué es?** Un multiplexor de terminal. Piensa en él como un gestor de ventanas dentro de tu terminal.
*   **¿Por qué está aquí?** Es una herramienta fundamental para el trabajo remoto. Te permite tener múltiples paneles y ventanas en una sola sesión, y lo más importante: puedes desconectarte de tu servidor sin que los procesos que dejaste corriendo (un script largo, un servidor de desarrollo) se detengan.
*   **Guía de Uso Práctico:**
    *   `tmux new -s mi_sesion`: Crea una nueva sesión con un nombre descriptivo (ej. "api-desarrollo").
    *   `Ctrl+b` luego `d`: Es la secuencia para "desconectarte" (detach) de la sesión actual. La sesión sigue viva en segundo plano.
    *   `tmux ls`: Lista todas las sesiones de tmux que están corriendo.
    *   `tmux attach -t mi_sesion`: Vuelve a "conectarte" (attach) a una sesión existente.
    *   `Ctrl+b` luego `%`: Divide el panel actual verticalmente.
    *   `Ctrl+b` luego `"`: Divide el panel actual horizontalmente.
*   **Documentación Oficial:** [tmux Wiki](https://github.com/tmux/tmux/wiki)

### 🔍 fzf
*   **¿Qué es?** Un buscador "fuzzy" (difuso) de línea de comandos de propósito general.
*   **¿Por qué está aquí?** Transforma la manera en que buscas archivos y comandos. En lugar de recordar nombres exactos, puedes escribir partes de lo que buscas y `fzf` te mostrará una lista interactiva y filtrada al instante.
*   **Guía de Uso Práctico:**
    *   `Ctrl+R`: Activa la búsqueda "fuzzy" en tu historial de comandos. Empieza a escribir partes de un comando antiguo y selecciónalo de la lista.
    *   `Ctrl+T`: Activa la búsqueda "fuzzy" de archivos y directorios. Úsalo para encontrar rápidamente un archivo en un proyecto grande y pegarlo en la línea de comandos.
*   **Documentación Oficial:** [fzf GitHub](https://github.com/junegunn/fzf)

### 🦇 bat
*   **¿Qué es?** Un reemplazo moderno del comando `cat`.
*   **¿Por qué está aquí?** `cat` simplemente vuelca el contenido de un archivo a la terminal. `bat` hace lo mismo pero con resaltado de sintaxis según el lenguaje, numeración de líneas e integración con Git para mostrar qué líneas han cambiado. Hace que revisar archivos desde la terminal sea mucho más legible.
*   **Guía de Uso Práctico:**
    *   `bat mi_archivo.py`: Muestra el contenido de un archivo Python con colores y formato.
    *   `bat -l`: Lista todos los lenguajes de programación que `bat` soporta.
*   **Documentación Oficial:** [bat GitHub](https://github.com/sharkdp/bat)

## II. Desarrollo de Software

El núcleo de herramientas para escribir, gestionar y ejecutar código.

### 🟢 NVM & Node.js
*   **¿Qué es?** NVM es el "Gestor de Versiones de Node". Node.js es el entorno que permite ejecutar JavaScript en el servidor.
*   **¿Por qué está aquí?** Diferentes proyectos pueden requerir diferentes versiones de Node.js. NVM te permite instalar múltiples versiones y cambiar entre ellas con un solo comando, evitando conflictos y asegurando que cada proyecto use la versión correcta. Es una práctica estándar en el desarrollo con JavaScript.
*   **Guía de Uso Práctico:**
    *   `nvm install --lts`: Instala la última versión con "Soporte a Largo Plazo" (LTS), la más estable y recomendada.
    *   `nvm ls`: Lista todas las versiones de Node.js que tienes instaladas.
    *   `nvm use 18.17.1`: Cambia a una versión específica de Node.js para tu sesión de terminal actual.
    *   `nvm alias default lts/*`: Establece la última versión LTS como la predeterminada para nuevas terminales.
*   **Documentación Oficial:** [NVM GitHub](https://github.com/nvm-sh/nvm)

### 🐍 Python & Pip
*   **¿Qué es?** Python es un lenguaje de programación versátil y popular. Pip es su gestor de paquetes.
*   **¿Por qué está aquí?** Es fundamental para la ciencia de datos (`pandas`, `numpy`, `scikit-learn`), desarrollo web (`Django`, `Flask`) y automatización de scripts. Este entorno asegura que tengas una versión moderna de Python 3 y Pip listos para usar.
*   **Guía de Uso Práctico:**
    *   `python3 -m venv .venv`: Crea un "entorno virtual" en una carpeta `.venv`. Esta es una práctica crucial para aislar las dependencias de cada proyecto.
    *   `source .venv/bin/activate`: Activa el entorno virtual. Cualquier paquete que instales con `pip` ahora se quedará dentro de esta carpeta.
    *   `pip install -r requirements.txt`: Instala todas las dependencias listadas en un archivo `requirements.txt`.
    *   `deactivate`: Desactiva el entorno virtual y regresa a la configuración global.
*   **Documentación Oficial:** [Python Docs](https://docs.python.org/3/)

## III. Cloud, DevOps y Contenedores

Herramientas para la automatización, despliegue y gestión de infraestructura moderna.

### 🐳 Docker & Docker Compose
*   **¿Qué es?** Docker empaqueta aplicaciones en "contenedores" auto-suficientes. Docker Compose gestiona aplicaciones compuestas por múltiples contenedores.
*   **¿Por qué está aquí?** Es el estándar de la industria para el desarrollo y despliegue de aplicaciones. Te permite ejecutar una base de datos, una API y un frontend en tu máquina con un solo comando, asegurando que el entorno de desarrollo sea idéntico al de producción.
*   **Guía de Uso Práctico:**
    *   `docker build -t mi-app .`: Construye una imagen de Docker a partir de un `Dockerfile` en el directorio actual.
    *   `docker run -p 8080:80 mi-app`: Ejecuta un contenedor desde una imagen, mapeando el puerto 80 del contenedor al 8080 de tu máquina.
    *   `docker-compose up`: Lee un archivo `docker-compose.yml` y levanta todos los servicios (contenedores) definidos en él.
    *   `docker ps -a`: Muestra todos los contenedores, incluyendo los que están detenidos.
*   **Documentación Oficial:** [Docker Docs](https://docs.docker.com/)

### 🏗️ Terraform
*   **¿Qué es?** Una herramienta de "Infraestructura como Código" (IaC).
*   **¿Por qué está aquí?** Te permite definir tu infraestructura de nube (servidores, bases de datos, redes) en archivos de configuración. Esto hace que tu infraestructura sea versionable (puedes usar Git), repetible y fácil de gestionar en equipo, en lugar de hacer clics manualmente en una consola web.
*   **Guía de Uso Práctico:**
    *   `terraform init`: Prepara tu directorio de trabajo, descargando los "providers" necesarios (ej. para AWS, Google Cloud, etc.).
    *   `terraform plan`: Crea un plan de ejecución. Te muestra exactamente qué recursos se van a crear, modificar o destruir. Es un paso de seguridad crucial.
    *   `terraform apply`: Aplica los cambios descritos en el plan.
    *   `terraform destroy`: Destruye toda la infraestructura gestionada por Terraform.
*   **Documentación Oficial:** [Terraform Docs](https://developer.hashicorp.com/terraform/docs)

### ☸️ Kubectl & Helm
*   **¿Qué es?** `kubectl` es la CLI para controlar Kubernetes. `Helm` es el gestor de paquetes para Kubernetes.
*   **¿Por qué está aquí?** Kubernetes es el sistema líder para orquestar contenedores a gran escala. `kubectl` es indispensable para interactuar con él. Helm simplifica la tarea de desplegar aplicaciones complejas en Kubernetes, empaquetándolas en "charts" reutilizables.
*   **Guía de Uso Práctico:**
    *   `kubectl get nodes`: Muestra los nodos (máquinas) que componen tu clúster.
    *   `kubectl get pods -n mi-namespace`: Lista los "pods" (contenedores) en un área específica del clúster.
    *   `helm repo add bitnami https://charts.bitnami.com/bitnami`: Añade un repositorio de charts populares.
    *   `helm install mi-postgres bitnami/postgresql`: Instala una base de datos PostgreSQL en tu clúster usando un chart de Helm.
*   **Documentación Oficial:** [Kubernetes Docs](https://kubernetes.io/docs/home/), [Helm Docs](https://helm.sh/docs/)

---

### 🔬 Notas Adicionales

#### Sobre la Creación de este Proyecto

Es importante mencionar que este proyecto ha sido desarrollado con el considerable apoyo de herramientas de IA generativa como **Gemini**. Este enfoque ha permitido acelerar el desarrollo y la investigación. Esto también implica que estoy en un proceso de aprendizaje continuo sobre los detalles más finos del código y la interacción entre componentes. La estructura y funcionalidad son sólidas, pero el estudio y la mejora son una constante.

#### Validación y Compatibilidad

*   Se han dedicado múltiples horas de prueba para validar que el entorno se despliega y funciona correctamente en **Google Cloud Shell**, que se basa en Debian.
*   Aunque el objetivo es que sea lo más universal posible, podrían existir detalles o errores al ejecutar los scripts en distribuciones de Linux o versiones diferentes. La colaboración para identificar y resolver estos problemas es muy bienvenida.

---

### 🤝 Contribuciones y Contacto

Este es un proyecto en constante evolución. Las contribuciones y sugerencias son bienvenidas. Si tienes una idea para mejorar el entorno o encuentras un error, por favor, abre un **Issue** o un **Pull Request**.

Para un contacto más directo, puedes encontrarme en:
*   **Discord:** `hcano.109`
*   **Email:** `[tu-correo-electronico@ejemplo.com]` (Por favor, reemplaza esto con tu email real)

### 📜 Licencia

Distribuido bajo la **Licencia MIT**.
