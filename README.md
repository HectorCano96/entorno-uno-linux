# Entorno de Desarrollo Linux: Portable, Profesional y Escalable

![Linux](https://img.shields.io/badge/OS-Linux-informational?style=flat&logo=linux&logoColor=white&color=2bbc8a)
![Shell](https://img.shields.io/badge/Shell-Bash-blue?style=flat&logo=gnu-bash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg)

---

## 📜 Descripción General

Este repositorio contiene un sistema completo para desplegar un **entorno de desarrollo Linux unificado, potente y portable** en cuestión de minutos. Está diseñado para ser la solución definitiva para estudiantes y profesionales que trabajan en múltiples máquinas (Cloud Shell, VMs, PCs nativos) y desean una experiencia consistente y profesional en todas ellas.

El proyecto nace como una herramienta de estudio en el marco del programa **Tech Advance de Oracle Next Generation (Generación 8)**, como parte de la ruta de aprendizaje para la certificación **OCI Foundations Associate - ONE**, pero su alcance es universal para cualquier entusiasta de Linux.

---

## 🎯 Filosofía del Proyecto

*   **Correcto:** Cada script está diseñado para ser predecible y funcionar sin errores.
*   **Fiable:** El entorno es **idempotente**; puedes ejecutar los scripts de instalación múltiples veces sin riesgo de romper nada.
*   **Estable:** Se utilizan herramientas probadas y consolidadas en la industria para garantizar la máxima estabilidad.
*   **Rápido:** A pesar de su potencia, el entorno es ágil y el despliegue en una nueva máquina es cuestión de minutos.

---

## 🌱 Una Nota del Autor: El Viaje y la Filosofía

<details>
<summary><strong>Haga clic para leer sobre el proceso y la visión detrás del proyecto</strong></summary>

> Como autor de este repositorio, es importante para mí compartir que este proyecto es un documento vivo y el reflejo de un intenso proceso de aprendizaje. Aunque no pretendo entender cada detalle intrínseco de cada comando, he dedicado horas a comprender la **esencia** de su funcionamiento, su propósito y el flujo lógico que los une.
> 
> Este entorno no es un simple agregado de herramientas, sino el resultado de pruebas rigurosas, de romper el sistema deliberadamente y reconstruirlo varias veces, siempre con el objetivo de cubrir las necesidades de **tiempo, practicidad, funcionalidad y escalabilidad** que requiere un proyecto serio en la ruta de la ciencia de datos y la nube.
> 
> Continúo estudiando y profundizando en cada componente. Por ello, cualquier aporte, corrección o sugerencia realizada de manera respetuosa no solo es bienvenida, sino profundamente agradecida, ya que contribuye a este viaje de conocimiento.
> 
> **Un agradecimiento especial a Gemini:** por acompañarme, darme luz y guiarme donde el mundo de la tecnología puede sentirse como un sendero de incertidumbre, miedo, falta de confianza y soledad en este mundo laboral tan apretado y complejo.

</details>

---

## 🚀 Guía de Inicio Rápido

Desplegar tu entorno personal en una nueva máquina Linux (basada en Debian/Ubuntu) es un proceso de 3 pasos:

1.  **Clona este repositorio:**
    ```bash
    git clone https://github.com/HectorCano96/entorno-uno-linux.git
    ```

2.  **Ejecuta el instalador:**
    ```bash
    cd entorno-uno-linux
    ./install.sh
    ```

3.  **¡Listo! Cierra y vuelve a abrir tu terminal.**
    La primera vez que la abras, el configurador se ejecutará para instalar todo el software. Esto puede tardar varios minutos. No te preocupes, es un proceso de única vez por máquina.

---

## 🧰 Guía de Herramientas y Comandos Esenciales

Este entorno no solo instala herramientas, sino que las prepara para ser usadas. Aquí tienes una guía de inicio rápido para las más importantes.

### Tmux: Gestor de Sesiones de Terminal
**Tmux** te permite tener múltiples ventanas y paneles en una sola terminal, y que estas persistan aunque te desconectes. Es indispensable para trabajar en servidores remotos o para organizar múltiples tareas.

*   **Comandos Esenciales:**
    *   `tmux new -s <nombre_sesion>` - Inicia una nueva sesión con un nombre.
    *   `tmux ls` - Lista las sesiones activas.
    *   `tmux attach -t <nombre_sesion>` - Se conecta a una sesión existente.
    *   Dentro de Tmux (usando el prefijo `Ctrl+b`):
        *   `Ctrl+b` `d` - Se desconecta de la sesión (la deja corriendo en segundo plano).
        *   `Ctrl+b` `c` - Crea una nueva ventana (como una pestaña de navegador).
        *   `Ctrl+b` `w` - Muestra una lista de ventanas para navegar.
        *   `Ctrl+b` `"` - Divide la ventana actual horizontalmente.
        *   `Ctrl+b` `%` - Divide la ventana actual verticalmente.

[➡️ Documentación de Tmux](https://github.com/tmux/tmux/wiki)

### Navegación Rápida: Zoxide y FZF
Olvídate de `cd` y el historial normal. **Zoxide** aprende tus directorios frecuentes y **FZF** potencia tu búsqueda.

*   **Comandos Esenciales:**
    *   `z <palabra_clave>` - Salta al directorio que mejor coincida con la palabra clave.
    *   `zi <palabra_clave>` - Inicia una búsqueda interactiva (con FZF) para elegir a qué directorio saltar.
    *   `Ctrl+R` - Activa la búsqueda "fuzzy" en tu historial de comandos.
    *   `Ctrl+T` - Activa FZF para buscar un archivo o directorio y pegarlo en la línea de comandos.
    *   `Alt+C` - Busca un directorio con FZF y se mueve a él instantáneamente.

[➡️ Documentación de Zoxide](https://github.com/ajeetdsouza/zoxide) | [➡️ Documentación de FZF](https://github.com/junegunn/fzf)

### Utilidades de Terminal Modernas: Bat y Eza
Reemplazos para los comandos clásicos `cat` y `ls` que ofrecen una experiencia visualmente superior y más informativa.

*   **Comandos Esenciales:**
    *   `bat <archivo>` - Muestra el contenido de un archivo con resaltado de sintaxis y números de línea.
    *   `eza` - El nuevo `ls`. Muestra los archivos con colores y de forma más limpia.
    *   `eza -l --icons --git` - Vista larga, con iconos y estado de Git para cada archivo.
    *   `eza --tree` - Muestra el contenido del directorio en formato de árbol.

[➡️ Documentación de Bat](https://github.com/sharkdp/bat) | [➡️ Documentación de Eza](https://github.com/eza-community/eza)

### Python y Ciencia de Datos: Gestión de Entornos
La mejor práctica para proyectos de Python es usar entornos virtuales para aislar dependencias. Tu entorno está listo para ello.

*   **Flujo de Trabajo Esencial:**
    1.  `python3 -m venv .venv` - Crea un nuevo entorno virtual en una carpeta `.venv`.
    2.  `source .venv/bin/activate` - Activa el entorno. Verás `(.venv)` en tu prompt.
    3.  `pip install pandas numpy jupyterlab` - Instala las librerías que necesites dentro del entorno activo.
    4.  `pip freeze > requirements.txt` - Guarda la lista de librerías en un archivo.
    5.  `deactivate` - Desactiva el entorno y vuelve a la terminal normal.

[➡️ Documentación de venv](https://docs.python.org/3/library/venv.html)

### Infraestructura como Código: Terraform
**Terraform** te permite definir y gestionar tu infraestructura de nube (en OCI, AWS, Azure, etc.) usando código.

*   **Ciclo de Vida Básico:**
    *   `terraform init` - Prepara tu directorio de trabajo, descargando los proveedores necesarios.
    *   `terraform plan` - Muestra los cambios que se realizarán en tu infraestructura.
    *   `terraform apply` - Aplica los cambios y crea los recursos.
    *   `terraform destroy` - Destruye los recursos gestionados por Terraform.

[➡️ Documentación de Terraform](https://developer.hashicorp.com/terraform/docs)

---

## 🔧 Personalización

La verdadera belleza de este proyecto es que es **tu** entorno. Para añadir una nueva herramienta, simplemente edita `setup_dev_tools.sh`. Para un nuevo alias, edita `.bashrc`. Después, guarda los cambios en tu repositorio con `git commit` y `git push`.

---

## 🤝 Contribuciones

Las ideas y contribuciones para mejorar este proyecto son siempre bienvenidas. El flujo de trabajo es el estándar de GitHub: abre un **Issue** para discutir tu idea y luego envía un **Pull Request** con tus cambios.

---

## 🙏 Agradecimientos

*   A **Oracle Next Generation (ONE)** por proporcionar la plataforma y el contexto de aprendizaje que inspiraron la creación de este proyecto.
*   A la vasta **comunidad de software de código abierto**, sobre cuyos hombros se asienta cada una de las herramientas aquí presentes.
*   Este entorno fue desarrollado en un proceso de colaboración con **Gemini**, el modelo de lenguaje grande de Google, demostrando un nuevo paradigma de desarrollo asistido por IA.

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo `LICENSE` para más detalles.
