# 🐚 shellnest

Framework personal de configuración de shell para macOS. Gestiona aliases, funciones, configuración git y SSH, organizado por contexto de proyecto.

## 📁 Estructura

```plaintext
shellnest/
├── shell/
│   ├── _git/git.sh          # Aliases y funciones git
│   ├── _clg/clg.sh          # Contexto Colegium
│   ├── _cmt/cmt.sh          # Contexto CMT
│   ├── _cns/cns.sh          # Contexto Consorcio
│   ├── _global/
│   │   ├── global.sh        # Aliases globales
│   │   └── variables.sh     # Variables de color compartidas
│   └── zsh/.zshrc           # Configuración principal ZSH
├── git/
│   ├── .gitconfig
│   └── .gitignore_global
├── symlinks/links.sh        # Crea enlaces simbólicos
└── install.sh               # Instalación automática (Fase 5)
```

## ⚙️ Instalación

```bash
git clone git@github.com:rodolfovcl/shellnest.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## 📌 Requisitos

- macOS + Zsh
- [Oh My Zsh](https://ohmyz.sh/)
- [Homebrew](https://brew.sh/)
- Plugins: `zsh-autosuggestions`, `zsh-syntax-highlighting`
- Herramientas: `nvm`, `fzf`, `tldr`

## 🔄 Recargar configuración

```bash
source ~/.zshrc
# o usar el alias
rs
```
