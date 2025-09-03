# ~/.bashrc: ejecutado por bash(1) para shells no-login.

# Si no se está ejecutando interactivamente, no hacer nada.
case $- in
    *i*) ;;
      *) return;;
esac

# Configuración del historial de comandos
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# Ajustar tamaño de la ventana
shopt -s checkwinsize

# Pipe para 'less'
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Configuración del prompt de color
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
else
    color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}[\033[01;32m]\u@\h[\033[00m]:[\033[01;34m]\w[\033[00m]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

# Título de la ventana para xterm
case "$TERM" in
xterm*|rxvt*) 
    PS1="[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a]$PS1"
    ;;
*)
    ;;
esac

# Habilitar colores para 'ls' y alias comunes
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias para notificaciones (corregido y comentado como referencia)
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\[0-9\]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Cargar alias personales si existen
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Habilitar autocompletado de bash
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ==============================================================================
# INICIO DE CONFIGURACIÓN PERSONALIZADA
# ==============================================================================

# 1. Añadir el directorio local de binarios al PATH
#    Esto es necesario para que comandos instalados por el usuario (como 'gemini')
#    sean encontrados por el sistema.
export PATH="$HOME/.local/bin:$PATH"

# 2. Cargar la configuración específica de Google Cloud Shell
#    Esto mantiene la integración y las funcionalidades de la plataforma.
if [ -f /google/devshell/bashrc.google ]; then
    source /google/devshell/bashrc.google
fi

# 3. Comprobación e instalación automática del entorno de desarrollo
#    Verifica si el entorno ya fue instalado usando un archivo de control (lock file).
#    Si no, ejecuta el script de instalación y crea el archivo de control al terminar con éxito.

# --- INICIO: Lógica robusta para encontrar la ruta real del script de instalación ---
# Esto es necesario porque .bashrc es un enlace simbólico (symlink).
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # Resuelve $SOURCE hasta que ya no sea un enlace simbólico.
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  # Si $SOURCE era un enlace simbólico relativo, resolverlo relativo a la ruta del enlace.
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
SCRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
setup_script_path="$SCRIPT_DIR/setup_dev_tools.sh"
# --- FIN: Lógica robusta ---

ENTORNO_UNO_LOCK_FILE="/tmp/entorno-uno-instalado.${USER}"
if [ ! -f "$ENTORNO_UNO_LOCK_FILE" ]; then
    echo "Entorno de desarrollo no detectado. Ejecutando configuración única..."
    echo "Esto puede tardar varios minutos. Las futuras terminales iniciarán al instante."

    if [ -f "$setup_script_path" ]; then
        # Ejecuta el script y, si tiene éxito (código de salida 0), crea el archivo de control.
        if bash "$setup_script_path"; then
            touch "$ENTORNO_UNO_LOCK_FILE"
            echo "Instalación completada y bandera creada en '$ENTORNO_UNO_LOCK_FILE'."
            echo "Esta bandera es temporal y se eliminará al reciclar la VM, disparando una nueva instalación."
        else
            echo "ADVERTENCIA: El script de instalación falló. La bandera no se creará." >&2
        fi
    else
        echo "ERROR CRÍTICO: No se encontró el script de instalación en '$setup_script_path'." >&2
    fi
fi

# ==============================================================================
# INICIO DE MEJORAS DE ENTORNO
# ==============================================================================

# 4. Alias para herramientas modernas
alias bat='batcat' # Usa 'batcat' (bat moderno) con el comando 'bat'.

# 5. Habilitar fzf (búsqueda fuzzy)
#    Activa autocompletado y atajos (Ctrl+T, Ctrl+R, Alt+C).
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# 6. Habilitar zoxide (navegación inteligente)
#    Permite saltar a directorios frecuentes con 'z'.
eval "$(zoxide init bash)"

# 7. Habilitar starship (prompt moderno)
#    Reemplaza el prompt de bash por uno más informativo y estético.
eval "$(starship init bash)"

# 8. Cargar NVM (Node Version Manager)
#    Esto permite usar 'nvm', 'node' y 'npm' en la terminal.
#    Debe cargarse después de cualquier instalación automática.
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  \. "$NVM_DIR/nvm.sh"  # Carga NVM
fi
