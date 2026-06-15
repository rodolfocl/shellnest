#================================================================
# IMPORTO VARIABLES GLOBALES
source $SHELLNEST/shell/global/variables.sh
#================================================================


# Node versions
alias 4="nvm use 4.9.1"
#alias 10="nvm use 10.4.1"
alias 10="nvm use 10.15.3"
alias 12="nvm use 12.16.3"
alias 14="nvm use 14.17.3"
alias 15="nvm use 15.13.0"

# ALIASES UTILIZADOS PARA TRABAJAR EN COLEGIUM

# Postulaciones: configurar host
alias host="sudo vim /private/etc/hosts"

# Jump to directories
alias ext='cd Documents/cloud/extracurriculares'
alias rei='cd Documents/cloud/reinscripciones'
alias pos='cd Documents/cloud/postulaciones'
alias inha='cd Documents/cloud/inhabilidad_docente'
alias ori='cd Documents/cloud/orientacion'
alias ges='cd Documents/cloud/gdd'
#alias api='cd Documents/cloud/colegium-api'
alias tt='cd Documents/webapp/teachertrack-webapp'
#alias apic='cd Documents/webapp/colegiumcloud-api'
alias esb='cd Documents/webapp/colegiumcloud-api_esb'
alias sn4='cd Documents/webapp/schoolnet4-webapp'
alias app='cd Documents/webapp/colegiumcloud-appbasefrontend'

# Execute projects
alias runa="nodemon colegium_api.js"
alias runp="nodemon postulaciones.js"
alias rune="nodemon extracurriculares.js"
alias runr="nodemon reinscripciones.js"
alias runi="nodemon inhadoc.js"
alias runo="nodemon orientacion.js"
alias rung="nodemon gdd.js"
#alias dev="npm run dev"




# FUNCIONES UTILIZADOS PARA TRABAJAR EN COLEGIUM ================

function run_old() {
  # Parametro ingresado a la funcion
  typeset PROYECTO
  PROYECTO="$1"

  if [[ ! "$PROYECTO" ]]; then
    echo ""
    echo "⚠️  ADVERTENCIA: Debes indicar que proyecto deseas ejecutar."
    echo "   Uso: run <proyecto>"
    echo ""
    echo " ${DGRAY}----------------------------${NC}"
    echo "→ ${YELLOW}api${NC}  :  Colegium-api "
    echo "→ ${YELLOW}pos${NC}  :  Postulaciones "
    echo "→ ${YELLOW}ext${NC}  :  Extracurriculares "
    echo "→ ${YELLOW}inha${NC} :  Inhabilidad Cloud"
    echo "→ ${YELLOW}oys${NC}  :  Orientacion OyS "
    echo "→ ${YELLOW}gdt${NC}  :  Gestion de talento GDT "
    echo "→ ${YELLOW}tt${NC}   :  TeacherTrack  "
    echo "→ ${YELLOW}tt15${NC} :  TeacherTrack 1.5 "
    echo "→ ${YELLOW}sn4${NC}  :  Schoolnet4 "
    echo "→ ${YELLOW}apic${NC} :  colegiumcloud-api "
    echo "→ ${YELLOW}esb${NC}  :  colegiumcloud-api_esb "
    echo "→ ${YELLOW}pa${NC}   :  procesosautomaticos_esb "
    echo "→ ${YELLOW}mar${NC}  :  marcaciones "
    echo " ${DGRAY}----------------------------${NC}"
    echo ""

  else
    # VUELVO AL HOME
    cd

    # COLEGIUM-API
    if [[ "api" == "$PROYECTO" ]]; then
      echo "💥 ${LCYAN}CARGANDO COLEGIUM-API${NC}"
      echo ""
      cd Documents/cloud/colegium-api
      pwd
      nvm use 4.9.1
      echo ""
      echo "⚙️  INICIANDO PROYECTO..."
      echo ""
      # progress_bar
      # nodemon colegium_api.js
      node colegium_api.js

    # POSTULACIONES
    elif [[ "pos" == "$PROYECTO" ]]; then
      echo "💥 ${LCYAN}CARGANDO POSTULACIONES${NC}"
      echo ""
      cd Documents/cloud/postulaciones
      pwd
      nvm use 4.9.1
      echo ""
      echo "⚙️  INICIANDO PROYECTO..."
      echo ""
      # progress_bar
      # nodemon postulaciones.js
      node postulaciones.js

    # EXTRACURRICULARES
    elif [[ "ext" == "$PROYECTO" ]]; then
      echo "💥 ${LCYAN}CARGANDO EXTRACURRICULARES${NC}"
      echo ""
      cd Documents/cloud/extracurriculares
      pwd
      nvm use 4.9.1
      echo ""
      echo "⚙️  INICIANDO PROYECTO..."
      echo ""
      # progress_bar
      # nodemon extracurriculares.js
      node extracurriculares.js

      # INHABILIDAD
      elif [[ "inha" == "$PROYECTO" ]]; then
      echo "💥 ${LCYAN}CARGANDO INHABILIDAD DOCENTE${NC}"
      echo ""
      cd Documents/cloud/inhabilidad_docente
      pwd
      nvm use 4.9.1
      echo ""
      echo "⚙️  INICIANDO PROYECTO..."
      echo ""
      # nodemon inhadoc.js
      node inhadoc.js

      # ORIENTACION Y SEGUIMINETO
      elif [[ "oys" == "$PROYECTO" ]]; then
      echo "💥 ${LCYAN}CARGANDO ORIENTACION Y SEGUIMIENTO${NC}"
      echo ""
      cd Documents/cloud/orientacion
      pwd
      nvm use 4.9.1
      echo ""
      echo "⚙️  INICIANDO PROYECTO..."
      echo ""
      # nodemon orientacion.js
      node orientacion.js

      # GESTION DE TALENTOS
      elif [[ "gdt" == "$PROYECTO" ]]; then
      echo "💥 ${LCYAN}CARGANDO GESTION DE TALENTOS${NC}"
      echo ""
      cd Documents/cloud/gdd
      pwd
      nvm use 4.9.1
      echo ""
      echo "⚙️  INICIANDO PROYECTO..."
      echo ""
      # nodemon gdd.js
      node gdd.js

    # TEACHERTRACK
    elif [[ "tt" == "$PROYECTO" ]]; then
      echo "💥 ${LCYAN}CARGANDO TEACHERTRACK${NC}"
      echo ""
      cd Documents/webapp/teachertrack-webapp
      pwd
      nvm use 10.15.3
      echo ""
      echo "⚙️  INICIANDO PROYECTO..."
      echo ""
      npm run dev

    # SCHOOLNET4
    elif [[ "sn4" == "$PROYECTO" ]]; then
      echo "💥 ${LCYAN}CARGANDO SCHOOLNET4${NC}"
      echo ""
      cd Documents/webapp/schoolnet4-webapp
      pwd
      nvm use 10.15.3
      echo ""
      echo "⚙️  INICIANDO PROYECTO..."
      echo ""
      npm run dev

    # COLEGIUMCLOUD-TEACHERTRACK-WEBAPP (APP BASE TT 1.5)
    elif [[ "tt15" == "$PROYECTO" ]]; then
      echo "💥 ${LCYAN}CARGANDO CCOLEGIUMCLOUD-TEACHERTRACK-WEBAPP 1.5${NC}"
      echo ""
      cd Documents/webapp/teachertrack15
      pwd
      nvm use 15.13.0
      echo ""
      echo "⚙️  INICIANDO PROYECTO..."
      echo ""
      npm run dev

    # COLEGIUMCLOUD-API
    elif [[ "apic" == "$PROYECTO" ]]; then
      echo "💥 ${LCYAN}CARGANDO COLEGIUMCLOUD-API${NC}"
      echo ""
      cd Documents/webapp/colegiumcloud-api
      pwd
      nvm use 10.15.3
      echo ""
      echo "⚙️  INICIANDO PROYECTO..."
      echo ""
      npm run dev

    # COLEGIUMCLOUD-API_ESB
    elif [[ "esb" == "$PROYECTO" ]]; then
      echo "💥 ${LCYAN}CARGANDO COLEGIUMCLOUD-API_ESB${NC}"
      echo ""
      cd Documents/webapp/colegiumcloud-api_esb
      pwd
      nvm use 10.15.3
      echo ""
      echo "⚙️  INICIANDO PROYECTO..."
      echo ""
      npm run dev

    # PROCESOSAUTOMATICOS_ESB
    elif [[ "pa" == "$PROYECTO" ]]; then
      echo "💥 ${LCYAN}CARGANDO PROCESOSAUTOMATICOS_ESB${NC}"
      echo ""
      cd Documents/webapp/procesosautomaticos_esb
      pwd
      nvm use 10.15.3
      echo ""
      echo "⚙️  INICIANDO PROYECTO..."
      echo ""
      npm run dev

    # FIRMAELECTRONICA-API
    elif [[ "fe" == "$PROYECTO" ]]; then
      echo "💥 ${LCYAN}CARGANDO FIRMAELECTRONICA-API${NC}"
      echo ""
      cd Documents/webapp/firmaelectronica-api
      pwd
      nvm use 12.16.3
      echo ""
      echo "⚙️  INICIANDO PROYECTO..."
      echo ""
      nodemon api

      # MARCACIONES
      elif [[ "mar" == "$PROYECTO" ]]; then
        echo "💥 ${LCYAN}CARGANDO CRON MARCACIONES${NC}"
        echo ""
        cd Documents/jobs/marcacron
        pwd
        nvm use 15.13.0
        echo ""
        echo "⚙️  INICIANDO PROYECTO..."
        echo ""
        nodemon cron

      # MARCACIONES
      elif [[ "denu" == "$PROYECTO" ]]; then
        echo "💥 ${LCYAN}CARGANDO MS-VIDA-DENUNCIOS${NC}"
        echo ""
        cd Documents/cns/ms-vida-denuncios
        pwd
        nvm use 19.2.0
        echo ""
        echo "⚙️  INICIANDO PROYECTO..."
        echo ""
        node app.js

    else
      echo ""
      echo "${DGRAY}###################################################${NC}"
      echo "${DGRAY}# ❌ ${NC}${RED}ERROR:${NC} EL PROYECTO INGRESADO NO ES VALIDO${DGRAY}   #${NC}"
      echo "${DGRAY}###################################################${NC}"
      echo ""
      cat $SHELLNEST/shell/images/.bowser
      echo ""
      echo "${DGRAY}###################################################${NC}"
      echo ""
      echo "⚠️   VERIFICA EL ALIAS DEL PROYECTO A EJECUTAR."
      echo "    USO: run <proyecto>"
      echo ""
      echo " ${DGRAY}   --------------------------------${NC}"
      echo "  →  ${YELLOW}api${NC}  :  Colegium-api "
      echo "  →  ${YELLOW}pos${NC}  :  Postulaciones "
      echo "  →  ${YELLOW}ext${NC}  :  Extracurriculares "
      echo "  →  ${YELLOW}inha${NC} :  Inhabilidad Cloud"
      echo "  →  ${YELLOW}oys${NC}  :  Orientacion OyS "
      echo "  →  ${YELLOW}gdt${NC}  :  Gestion de talento GDT "
      echo "  →  ${YELLOW}tt${NC}   :  TeacherTrack  "
      echo "  →  ${YELLOW}tt15${NC} :  TeacherTrack 1.5 "
      echo "  →  ${YELLOW}sn4${NC}  :  Schoolnet4 "
      echo "  →  ${YELLOW}apic${NC} :  colegiumcloud-api "
      echo "  →  ${YELLOW}esb${NC}  :  colegiumcloud-api_esb "
      echo "  →  ${YELLOW}pa${NC}   :  procesosautomaticos_esb "
      echo "  →  ${YELLOW}mar${NC}  :  marcaciones "
      echo "  →  ${YELLOW}denu${NC} :  ms-vida-denuncios "
      echo " ${DGRAY}   --------------------------------${NC}"
      echo ""
      echo "${DGRAY}###################################################${NC}"
      echo ""
    fi
  fi
}
