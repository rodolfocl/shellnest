# ===============================================================
# IMPORTO ARCHIVO INDEX REDIRECCIONANDO A LOS ALIASES Y FUNCIONES
export DOTFILES="$HOME/.dotfiles"
source $DOTFILES/shell/_git/git.sh
source $DOTFILES/shell/_global/global.sh
# ==============================================================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
