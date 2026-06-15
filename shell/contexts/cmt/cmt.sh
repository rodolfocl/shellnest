#================================================================
# IMPORTO VARIABLES GLOBALES
source $SHELLNEST/shell/global/variables.sh
#================================================================

# Paleta CMT (256 colores, tonos pastel)
CMT_ACCENT='\033[38;5;110m'  # azul empolvado   — ◆ CMT
CMT_DIM='\033[38;5;238m'     # gris oscuro sutil — │ └─
CMT_LABEL='\033[38;5;244m'   # gris medio        — labels
CMT_VALUE='\033[38;5;153m'   # azul pastel claro — nombre proyecto
CMT_START='\033[38;5;150m'   # verde sage        — Iniciando
CMT_ALIAS='\033[38;5;222m'   # dorado suave      — alias del menú

# CENTRO MEDICO DEL TRABAJADOR

# Node versions
alias 24="nvm use 24.15.0"
alias 22="nvm use 22.14.0"
alias 18="nvm use 18.20.6"
alias 16="nvm use 16.20.2"

# Generales
alias host="sudo vim /private/etc/hosts"
alias rs="source ~/.zshrc "
alias cc="source ~/.zshrc "

# Directories CMT
alias cmt='cd Documents/cmt'
alias integrations='cd Documents/cmt/integrations'
alias sage='cd Documents/cmt/sage'
alias presenter='cd Documents/cmt/sage/sage-presenter'
alias general='cd Documents/cmt/general'
alias data='cd Documents/cmt/integrations/data-collector-server'
alias queue='cd Documents/cmt/integrations/queue-management-server'
alias conf='cd Documents/cmt/integrations/confirmation-message-server'
alias bionet='cd Documents/cmt/integrations/laboratory-bionet'
alias bupa='cd Documents/cmt/integrations/laboratory-server'
alias synlab='cd Documents/cmt/integrations/synlab'
alias rx='cd Documents/cmt/integrations/rx-server'
alias invoice='cd Documents/cmt/integrations/invoices-server'
alias hubspot='cd Documents/cmt/integrations/hubspot-bulk'
alias sofsalud='cd Documents/cmt/integrations/laboratory-sofsalud'


# Execute projects
# alias go='npm run start:dev'
# alias dev="npm run dev"


# FUNCIONES CMT =====================================================

function run() {
  typeset PROYECTO
  PROYECTO="$1"

  # ── Menú de ayuda
  _cmt_menu() {
    echo ""
    echo "  ${BOLD}${CMT_ACCENT}CMT${NC}  ${CMT_LABEL}·${NC}  Laboratorios"
    echo ""
    echo "  ${CMT_LABEL}Proyectos disponibles:${NC}"
    echo ""
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "bionet"   "laboratory-bionet"
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "bupa"     "laboratory-server"
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "synlab"   "synlab"
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "sofsalud" "laboratory-sofsalud"
    echo ""
    echo "  ${CMT_LABEL}Uso: run <proyecto>${NC}"
    echo ""
  }

  # ── Encabezado de inicio
  _cmt_header() {
    local nombre="$1" node="$2" ruta="$3"
    echo ""
    echo "  ${BOLD}${CMT_ACCENT}⊡${NC} ${BOLD}CMT${NC}  ${CMT_LABEL}·${NC}  Laboratorios"
    echo ""
    printf "  ${CMT_DIM}│${NC}  ${CMT_LABEL}%-12s${NC}  ${BOLD}${CMT_VALUE}%s${NC}\n"  "proyecto"   "$nombre"
    printf "  ${CMT_DIM}│${NC}  ${CMT_LABEL}%-12s${NC}  %s\n"                          "node"       "$node"
    printf "  ${CMT_DIM}│${NC}  ${CMT_LABEL}%-12s${NC}  ${CMT_LABEL}%s${NC}\n"         "directorio" "$ruta"
    echo "  ${CMT_DIM}│${NC}"
    echo "  ${CMT_DIM}└─${NC} ${CMT_START} ▸ Iniciando servidor...${NC}"
    echo ""
  }

  if [[ -z "$PROYECTO" ]]; then
    _cmt_menu

  else
    cd

    case "$PROYECTO" in

      bionet)
        cd Documents/cmt/integrations/laboratory-bionet
        nvm use 22.14.0 --silent
        _cmt_header "laboratory-bionet" "22.14.0" "~/Documents/cmt/integrations/laboratory-bionet"
        serverless offline --stage dev
        ;;

      bupa)
        cd Documents/cmt/integrations/laboratory-server
        nvm use 22.14.0 --silent
        _cmt_header "laboratory-server" "22.14.0" "~/Documents/cmt/integrations/laboratory-server"
        serverless offline --stage dev
        ;;

      synlab)
        cd Documents/cmt/integrations/synlab
        nvm use 22.14.0 --silent
        _cmt_header "synlab" "22.14.0" "~/Documents/cmt/integrations/synlab"
        serverless offline --stage dev
        ;;

      sofsalud)
        cd Documents/cmt/integrations/laboratory-sofsalud
        nvm use 24.15.0 --silent
        _cmt_header "laboratory-sofsalud" "24.15.0" "~/Documents/cmt/integrations/laboratory-sofsalud"
        osls offline --stage dev
        ;;

      *)
        echo ""
        echo "  ${RED}✖${NC}  ${CMT_LABEL}Proyecto ${NC}${BOLD}\"$PROYECTO\"${NC}${CMT_LABEL} no encontrado${NC}"
        _cmt_menu
        ;;

    esac
  fi
}
