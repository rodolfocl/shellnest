# VARIABLES GLOBALES
# PARA QUE LAS FUNCIONES TENGAN ACCESO A ELLAS

# Colores para el texto
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux


# Colores para el background del texto
# https://nick3499.medium.com/bash-echo-text-color-background-color-e8d8c41d5a91
# https://tecadmin.net/change-background-color-of-text-in-linux-shell/


# Color texto
RED='\033[0;31m'
DGRAY='\033[1;30m'
YELLOW='\033[1;33m'
LCYAN='\033[1;36m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Background color texto
B_WHITE='\e[0;47m'
B_NC='\e[0m' # No Color

# Formato texto
BOLD=$(tput bold)
NORMAL=$(tput sgr0)