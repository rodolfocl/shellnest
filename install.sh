#!/usr/bin/env zsh

# shellnest — instalador de entorno personal
# Uso: git clone git@github.com:rodolfocl/shellnest.git ~/.shellnest && ~/.shellnest/install.sh

SHELLNEST="$(cd "$(dirname "$0")" && pwd)"

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
LCYAN='\033[1;36m'
DGRAY='\033[1;30m'
NC='\033[0m'

_ok()      { echo "${GREEN}✔${NC}  $1"; }
_skip()    { echo "${YELLOW}→${NC}  $1 ${DGRAY}(ya instalado)${NC}"; }
_updated() { echo "${GREEN}→${NC}  $1 ${GREEN}(actualizado)${NC}"; }
_info()    { echo "${LCYAN}…${NC}  $1"; }
_err()     { echo "${RED}✘${NC}  $1"; }

# Flag de actualización: --update como argumento o pregunta interactiva
UPDATE=false
if [[ "$1" == "--update" ]]; then
  UPDATE=true
else
  echo ""
  printf "  ¿Actualizar paquetes ya instalados? [y/N] "
  read -r _reply
  [[ "$_reply" =~ ^[Yy]$ ]] && UPDATE=true
fi

echo ""
echo "${LCYAN}╔══════════════════════════════╗${NC}"
echo "${LCYAN}║       shellnest install      ║${NC}"
echo "${LCYAN}╚══════════════════════════════╝${NC}"
echo ""


# ==============================================================
# HOMEBREW
# ==============================================================
echo "${DGRAY}── Homebrew ───────────────────────────${NC}"

if command -v brew &>/dev/null; then
  _skip "Homebrew"
  if $UPDATE; then
    _info "Actualizando Homebrew..."
    brew update --quiet && _updated "Homebrew"
  fi
else
  _info "Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  _ok "Homebrew instalado"
fi
echo ""


# ==============================================================
# OH MY ZSH
# ==============================================================
echo "${DGRAY}── Oh My Zsh ──────────────────────────${NC}"

if [[ -d "$HOME/.oh-my-zsh" ]]; then
  _skip "Oh My Zsh"
  if $UPDATE; then
    _info "Actualizando Oh My Zsh..."
    git -C "$HOME/.oh-my-zsh" pull --quiet && _updated "Oh My Zsh"
  fi
else
  _info "Instalando Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  _ok "Oh My Zsh instalado"
fi
echo ""


# ==============================================================
# PLUGINS ZSH
# ==============================================================
echo "${DGRAY}── Plugins Zsh ────────────────────────${NC}"

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [[ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
  _skip "zsh-autosuggestions"
  if $UPDATE; then
    _info "Actualizando zsh-autosuggestions..."
    git -C "$ZSH_CUSTOM/plugins/zsh-autosuggestions" pull --quiet && _updated "zsh-autosuggestions"
  fi
else
  _info "Instalando zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" --quiet
  _ok "zsh-autosuggestions instalado"
fi

if [[ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
  _skip "zsh-syntax-highlighting"
  if $UPDATE; then
    _info "Actualizando zsh-syntax-highlighting..."
    git -C "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" pull --quiet && _updated "zsh-syntax-highlighting"
  fi
else
  _info "Instalando zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" --quiet
  _ok "zsh-syntax-highlighting instalado"
fi
echo ""


# ==============================================================
# PAQUETES BREW
# ==============================================================
echo "${DGRAY}── Paquetes Homebrew ──────────────────${NC}"

brew_install() {
  local pkg=$1
  local cmd=${2:-$1}
  if command -v "$cmd" &>/dev/null || brew list "$pkg" &>/dev/null 2>&1; then
    _skip "$pkg"
    if $UPDATE; then
      _info "Actualizando $pkg..."
      brew upgrade "$pkg" 2>/dev/null && _updated "$pkg" || _skip "$pkg (sin actualizaciones)"
    fi
  else
    _info "Instalando $pkg..."
    brew install "$pkg"
    _ok "$pkg instalado"
  fi
}

brew_install "nvm"
brew_install "fzf"
brew_install "tldr"
brew_install "php@8.2" "php"
echo ""


# ==============================================================
# SYMLINKS
# ==============================================================
echo "${DGRAY}── Symlinks ───────────────────────────${NC}"

make_link() {
  local src=$1
  local dest=$2

  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
    _skip "$(basename "$dest")"
    return
  fi

  if [[ -e "$dest" && ! -L "$dest" ]]; then
    mv "$dest" "${dest}.bak"
    _info "$(basename "$dest") → backup guardado en ${dest}.bak"
  fi

  ln -sf "$src" "$dest"
  _ok "$(basename "$dest") → $src"
}

mkdir -p "$HOME/.ssh"

make_link "$SHELLNEST/shell/zsh/.zshrc"         "$HOME/.zshrc"
make_link "$SHELLNEST/shell/bash/.bashrc"        "$HOME/.bashrc"
make_link "$SHELLNEST/shell/bash/.bash_profile"  "$HOME/.bash_profile"
make_link "$SHELLNEST/git/.gitconfig"            "$HOME/.gitconfig"
make_link "$SHELLNEST/git/.gitignore_global"     "$HOME/.gitignore_global"
make_link "$SHELLNEST/shell/_ssh/config"         "$HOME/.ssh/config"
echo ""


# ==============================================================
# LISTO
# ==============================================================
echo "${DGRAY}───────────────────────────────────────${NC}"
echo ""
echo "${GREEN}shellnest instalado correctamente${NC}"
echo ""
echo "  Recargá tu shell para aplicar los cambios:"
echo "  ${YELLOW}source ~/.zshrc${NC}"
echo ""
echo "  Si agregás hosts SSH privados (servidores de trabajo):"
echo "  ${YELLOW}vim ~/.ssh/config.local${NC}  ${DGRAY}← no se versiona${NC}"
echo ""