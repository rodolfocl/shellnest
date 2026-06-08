# =======================================================================================
# DESDE LA RAIZ DEL PROYECTO
# =======================================================================================

# EJECUTAR DESDE EL HOME /USERS/RODOLFOVENEGAS
# sh .dotfiles/symlinks/links.sh


# =======================================================================================
# PASOS A EJECUTAR
# =======================================================================================

# Si el archivo no existe en .dotfiles se debe mover archivos dentro del proyecto.
# Si ya existe eliminar el archivo de la raiz del proyecto, se creara un ¡no nuevo con link simbolico.

# MOVER:
# mv .gitconfig .dotfiles/git

# ELIMINAR:
# Seleccionar archivo y eliminar

# =======================================================================================
# CREAR LINKS SIMBOLICOS
# =======================================================================================

# Listados de links simbolicos
# ruta donde esta el archivo " " donde estaba antes el archivo
# Ver video si quedan dudas: https://onedrive.live.com/?cid=1C5A9C77DFE4D4B9&id=1C5A9C77DFE4D4B9%21126149&parId=1C5A9C77DFE4D4B9%21126136&o=OneUp

# ZSH
ln -s .dotfiles/shell/zsh/.zshrc $PWD/.zshrc

# BASH
ln -s .dotfiles/shell/bash/.bashrc $PWD/.bashrc
ln -s .dotfiles/shell/bash/.bash_profile $PWD/.bash_profile

# GIT
ln -s .dotfiles/git/.gitconfig $PWD/.gitconfig
ln -s .dotfiles/git/.gitignore_global $PWD/.gitignore_global

# SSH
ln -sf $HOME/.dotfiles/shell/_ssh/config $HOME/.ssh/config

# iTerm2
# No tiene link simbolico se agrega directo desde la configuracion/general/preferences

# Karabiner-elements
# mv .config/karabiner/karabiner.json .dotfiles/so/mac/karabiner-elements/
#ln -s .dotfiles/so/mac/karabiner-elements/karabiner.json $PWD/.config/karabiner/karabiner.json


# VSCODE
#ln -s .dotfiles/editors/vs-code/settings.json $PWD/Library/Application\ Support/code/user/settings.json
#ln -s .dotfiles/editors/vs-code/keybindings.json $PWD/Library/Application\ Support/code/user/keybindings.json
#ln -s .dotfiles/editors/vs-code/snippets $PWD/Library/Application\ Support/code/user/snippets

# ver solo los archivos que tengan enlace simbolico
# ls -la | grep "\->"