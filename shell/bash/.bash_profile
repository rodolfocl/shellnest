source ~/.profile
# ===============================================================
# IMPORTO ARCHIVO INDEX REDIRECCIONANDO A LOS ALIASES Y FUNCIONES
export SHELLNEST="$HOME/.shellnest"
source $SHELLNEST/shell/_git/git.sh
source $SHELLNEST/shell/_global/global.sh
# ==============================================================

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

