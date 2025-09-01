#!/bin/bash
# Este script crea enlaces simbólicos desde el directorio home del usuario
# a los archivos de configuración (dotfiles) ubicados en este repositorio.

# Directorio donde se encuentra el script (y los dotfiles)
# Se asegura de que funcione incluso si se llama desde otro lugar.
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Archivos de configuración a enlazar en el directorio home
FILES_TO_SYMLINK=(".bashrc")

echo "Iniciando la configuración de dotfiles..."

for file in "${FILES_TO_SYMLINK[@]}"; do
    source_file="$DOTFILES_DIR/$file"
    target_file="$HOME/$file"

    echo "Procesando $file..."

    # Si el archivo de destino ya existe en el home, crea un backup
    if [ -e "$target_file" ]; then
        # Si ya es un enlace simbólico que apunta al lugar correcto, no hacemos nada.
        if [ -L "$target_file" ] && [ "$(readlink "$target_file")" = "$source_file" ]; then
            echo "  - El enlace simbólico correcto ya existe. Omitiendo."
            continue
        fi
        
        backup_file="${target_file}.bak.$(date +%Y%m%d%H%M%S)"
        echo "  - Se encontró un archivo o enlace existente. Creando backup en ${backup_file}"
        mv "$target_file" "$backup_file"
    fi

    # Crea el enlace simbólico
    echo "  - Creando enlace simbólico: $target_file -> $source_file"
    ln -sfn "$source_file" "$target_file"
done

echo ""
echo "¡Instalación completada!"
echo "Para aplicar los cambios, por favor, reinicia tu shell o ejecuta: source ~/.bashrc"
