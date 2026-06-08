#================================================================
# IMPORTO VARIABLES GLOBALES
source $SHELLNEST/shell/_global/variables.sh
#================================================================

# SSH FRAMEWORK — shellnest


function tunnel() {
  # Abre un tunnel SSH en background
  # Uso: tunnel <puerto-local> <host> <puerto-remoto>
  local local_port=$1
  local host=$2
  local remote_port=$3

  if [[ -z "$local_port" || -z "$host" || -z "$remote_port" ]]; then
    echo ""
    echo "${YELLOW}Uso:${NC} tunnel <puerto-local> <host> <puerto-remoto>"
    echo "${DGRAY}Ejemplo: tunnel 5432 mi-servidor 5432${NC}"
    echo ""
    return 1
  fi

  ssh -f -N -L "${local_port}:localhost:${remote_port}" "$host"
  echo ""
  echo "${GREEN}✔${NC} Tunnel abierto: ${LCYAN}localhost:${local_port}${NC} → ${LCYAN}${host}:${remote_port}${NC}"
  echo ""
}


function tunnels() {
  # Lista todos los tunnels SSH activos con su PID
  echo ""
  echo "${DGRAY}——————————————————————————————${NC}"
  echo "  ${LCYAN}Tunnels SSH activos${NC}"
  echo "${DGRAY}——————————————————————————————${NC}"

  local results
  results=$(ps aux | grep "ssh -f -N -L" | grep -v grep)

  if [[ -z "$results" ]]; then
    echo "  ${YELLOW}No hay tunnels activos${NC}"
  else
    echo "$results" | awk '{printf "  PID: '"${YELLOW}"'%s'"${NC}"'  %s\n", $2, $0}' | \
      grep -o "PID:.*"
    echo ""
    ps aux | grep "ssh -f -N -L" | grep -v grep | \
      awk '{print "  '"${YELLOW}"'PID " $2 "'"${NC}"'  " $11 " " $12 " " $13 " " $14}'
  fi

  echo "${DGRAY}——————————————————————————————${NC}"
  echo ""
}


function kill-tunnel() {
  # Cierra un tunnel SSH por PID
  # Uso: kill-tunnel <PID>
  local pid=$1

  if [[ -z "$pid" ]]; then
    echo ""
    echo "${YELLOW}Uso:${NC} kill-tunnel <PID>"
    echo "${DGRAY}Tip: usa 'tunnels' para ver los PIDs activos${NC}"
    echo ""
    return 1
  fi

  kill "$pid" 2>/dev/null && \
    echo "\n${GREEN}✔${NC} Tunnel ${YELLOW}PID ${pid}${NC} cerrado\n" || \
    echo "\n${RED}✘${NC} No se encontró el proceso ${YELLOW}${pid}${NC}\n"
}


function push-key() {
  # Copia la clave pública al host remoto
  # Uso: push-key <host>
  local host=$1

  if [[ -z "$host" ]]; then
    echo ""
    echo "${YELLOW}Uso:${NC} push-key <host>"
    echo ""
    return 1
  fi

  echo "\n${LCYAN}→${NC} Copiando clave pública a ${YELLOW}${host}${NC}...\n"
  ssh-copy-id "$host"
}


function ssh-all() {
  # Ejecuta un comando en múltiples hosts en paralelo
  # Uso: ssh-all "<comando>" <host1> <host2> ...
  local cmd=$1
  shift
  local hosts=("$@")

  if [[ -z "$cmd" || ${#hosts[@]} -eq 0 ]]; then
    echo ""
    echo "${YELLOW}Uso:${NC} ssh-all \"<comando>\" <host1> <host2> ..."
    echo "${DGRAY}Ejemplo: ssh-all \"uptime\" servidor1 servidor2${NC}"
    echo ""
    return 1
  fi

  for host in "${hosts[@]}"; do
    echo "${DGRAY}——————————————————————————————${NC}"
    echo "  ${LCYAN}${host}${NC}"
    echo "${DGRAY}——————————————————————————————${NC}"
    ssh "$host" "$cmd"
    echo ""
  done
}


function ssh-edit() {
  # Abre el archivo ~/.ssh/config en el editor
  ${EDITOR:-vim} ~/.ssh/config
}


function ssh-hosts() {
  # Lista todos los hosts definidos en ~/.ssh/config
  echo ""
  echo "${DGRAY}——————————————————————————————${NC}"
  echo "  ${LCYAN}Hosts en ~/.ssh/config${NC}"
  echo "${DGRAY}——————————————————————————————${NC}"
  grep -E "^Host " ~/.ssh/config ~/.ssh/config.local 2>/dev/null | \
    grep -v "\*" | \
    awk '{printf "  '"${YELLOW}"'→'"${NC}"'  %s\n", $2}'
  echo "${DGRAY}——————————————————————————————${NC}"
  echo ""
}


function sshfs-mount() {
  # Monta una carpeta remota via SSHFS
  # Uso: sshfs-mount <host> <ruta-remota> <punto-de-montaje-local>
  local host=$1
  local remote_path=$2
  local local_mount=$3

  if [[ -z "$host" || -z "$remote_path" || -z "$local_mount" ]]; then
    echo ""
    echo "${YELLOW}Uso:${NC} sshfs-mount <host> <ruta-remota> <punto-de-montaje>"
    echo "${DGRAY}Ejemplo: sshfs-mount mi-servidor /var/www ~/mnt/www${NC}"
    echo "${DGRAY}Requiere: brew install macfuse sshfs${NC}"
    echo ""
    return 1
  fi

  if ! command -v sshfs &>/dev/null; then
    echo "\n${RED}✘${NC} sshfs no está instalado. Instalá con: ${YELLOW}brew install macfuse sshfs${NC}\n"
    return 1
  fi

  mkdir -p "$local_mount"
  sshfs "${host}:${remote_path}" "$local_mount" -o follow_symlinks
  echo "\n${GREEN}✔${NC} Montado ${LCYAN}${host}:${remote_path}${NC} en ${YELLOW}${local_mount}${NC}\n"
}