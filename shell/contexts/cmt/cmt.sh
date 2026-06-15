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
CMT_SILVER='\033[38;5;251m'  # gris plateado     — barra de progreso

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
alias ecg='cd Documents/cmt/integrations/ecg-edx'
alias biartic='cd Documents/cmt/integrations/optometry-biartic'
alias drug='cd Documents/cmt/integrations/drugs-server'
alias api2='cd Documents/cmt/integrations/api-v2-server'
alias signer='cd Documents/cmt/integrations/signer-server'


# Execute projects
# alias go='npm run start:dev'
# alias dev="npm run dev"


# FUNCIONES CMT =====================================================

function run() {
  typeset PROYECTO
  PROYECTO="$1"

  # Menú de ayuda
  _cmt_menu() {
    echo ""
    echo "  ${BOLD}${CMT_ACCENT}Integración${NC}  ${CMT_LABEL}·${NC}  Laboratorios"
    echo ""
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "bionet"   "laboratory-bionet"
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "bupa"     "laboratory-server"
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "synlab"   "synlab"
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "sofsalud" "laboratory-sofsalud"
    echo ""
    echo "  ${BOLD}${CMT_ACCENT}Integración${NC}  ${CMT_LABEL}·${NC}  Máquinas"
    echo ""
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "ecg"   "ecg-edx"
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "rx"    "rx-server"
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "biartic"   "optometry-biartic"
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "drug" "drugs-server"
    echo ""
    echo "  ${BOLD}${CMT_ACCENT}Integración${NC}  ${CMT_LABEL}·${NC}  Servicios"
    echo ""
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "api2"    "api-v2-server"
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "hubspot" "hubspot-bulk"
    printf "    ${CMT_ALIAS}%-10s${NC}  ${CMT_LABEL}%s${NC}\n" "signer"  "signer-server"
    echo ""
    echo "  ${CMT_LABEL}Uso: run <proyecto>${NC}"
    echo ""
  }

  # Encabezado de inicio
  _cmt_header() {
    local nombre="$1" node="$2" ruta="$3" categoria="${4:-CMT}"
    echo ""
    echo "  ${BOLD}${CMT_ACCENT}⊡${NC} ${BOLD}CMT${NC}  ${CMT_LABEL}·${NC}  $categoria"
    echo ""
    printf "  ${CMT_DIM}│${NC}  ${CMT_LABEL}%-12s${NC}  ${BOLD}${CMT_VALUE}%s${NC}\n"  "proyecto"   "$nombre"
    printf "  ${CMT_DIM}│${NC}  ${CMT_LABEL}%-12s${NC}  %s\n"                          "node"       "$node"
    printf "  ${CMT_DIM}│${NC}  ${CMT_LABEL}%-12s${NC}  ${CMT_LABEL}%s${NC}\n"         "directorio" "$ruta"
    echo "  ${CMT_DIM}│${NC}"
    echo "  ${CMT_DIM}└─${NC} ${CMT_START} ▸ Iniciando servidor...${NC}"
    echo ""
    # Animación de carga (barra de progreso)
    local total=36
    local blocks="" empty=""
    for k in $(seq 1 $total); do blocks="${blocks}█"; empty="${empty}░"; done
    for i in $(seq 1 $total); do
      local pct=$(( i * 100 / total ))
      local filled="${blocks:0:$i}"
      local rest="${empty:$i}"
      printf "\r\033[2K  ${CMT_SILVER}%s${CMT_DIM}%s${NC}  ${CMT_LABEL}%3d%%${NC}" "$filled" "$rest" $pct
      sleep 0.028
    done
    printf "\n\n"
  }

  if [[ -z "$PROYECTO" ]]; then
    _cmt_menu

  else
    cd

    case "$PROYECTO" in

      bionet)
        cd Documents/cmt/integrations/laboratory-bionet
        nvm use 22.14.0 --silent
        _cmt_header "laboratory-bionet" "22.14.0" "~/Documents/cmt/integrations/laboratory-bionet" "Laboratorios"
        serverless offline --stage dev
        ;;

      bupa)
        cd Documents/cmt/integrations/laboratory-server
        nvm use 22.14.0 --silent
        _cmt_header "laboratory-server" "22.14.0" "~/Documents/cmt/integrations/laboratory-server" "Laboratorios"
        serverless offline --stage dev
        ;;

      synlab)
        cd Documents/cmt/integrations/synlab
        nvm use 22.14.0 --silent
        _cmt_header "synlab" "22.14.0" "~/Documents/cmt/integrations/synlab" "Laboratorios"
        serverless offline --stage dev
        ;;

      sofsalud)
        cd Documents/cmt/integrations/laboratory-sofsalud
        nvm use 24.15.0 --silent
        _cmt_header "laboratory-sofsalud" "24.15.0" "~/Documents/cmt/integrations/laboratory-sofsalud" "Laboratorios"
        osls offline --stage dev
        ;;

      ecg)
        cd Documents/cmt/integrations/ecg-edx
        nvm use 22.14.0 --silent
        _cmt_header "ecg-edx" "22.14.0" "~/Documents/cmt/integrations/ecg-edx" "Máquinas"
        serverless offline --stage dev
        ;;

      rx)
        cd Documents/cmt/integrations/rx-server
        nvm use 22.14.0 --silent
        _cmt_header "rx-server" "22.14.0" "~/Documents/cmt/integrations/rx-server" "Máquinas"
        serverless offline --stage dev
        ;;

      biartic)
        cd Documents/cmt/integrations/optometry-biartic
        nvm use 22.14.0 --silent
        _cmt_header "optometry-biartic" "22.14.0" "~/Documents/cmt/integrations/optometry-biartic" "Máquinas"
        serverless offline --stage dev
        ;;

      drug)
        cd Documents/cmt/integrations/drugs-server
        nvm use 22.14.0 --silent
        _cmt_header "drugs-server" "22.14.0" "~/Documents/cmt/integrations/drugs-server" "Máquinas"
        serverless offline --stage dev
        ;;

      api2)
        cd Documents/cmt/integrations/api-v2-server
        nvm use 22.14.0 --silent
        _cmt_header "api-v2-server" "22.14.0" "~/Documents/cmt/integrations/api-v2-server" "Servicios"
        serverless offline --stage dev
        ;;

      hubspot)
        cd Documents/cmt/integrations/hubspot-bulk
        nvm use 24.15.0 --silent
        _cmt_header "hubspot-bulk" "24.15.0" "~/Documents/cmt/integrations/hubspot-bulk" "Servicios"
        osls offline --stage dev
        ;;

      signer)
        cd Documents/cmt/integrations/signer-server
        nvm use 22.14.0 --silent
        _cmt_header "signer-server" "22.14.0" "~/Documents/cmt/integrations/signer-server" "Servicios"
        serverless offline --stage dev
        ;;

      *)
        echo ""
        echo "  ${RED}✖${NC}  ${CMT_LABEL}Proyecto ${NC}${BOLD}\"$PROYECTO\"${NC}${CMT_LABEL} no encontrado${NC}"
        _cmt_menu
        ;;

    esac
  fi
}
