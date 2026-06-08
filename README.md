# 🐚 shellnest

Framework personal de configuración de shell para macOS. Gestiona aliases, funciones, configuración git y SSH, organizado por contexto de proyecto.

---

## 🚀 Mac nueva — un solo comando

```bash
git clone git@github.com:rodolfocl/shellnest.git ~/.shellnest && ~/.shellnest/install.sh
```

> El script instala dependencias, plugins y crea los symlinks automáticamente.
> Al inicio pregunta si querés actualizar los paquetes ya instalados.

---

## 🔄 Actualizar paquetes instalados

Desde una instalación existente, podés actualizar todo con el flag `--update`:

```bash
~/.shellnest/install.sh --update
```

O simplemente corré `install.sh` sin argumentos y respondé `y` a la pregunta inicial.

Qué hace `--update`:

- **Homebrew** → `brew update`
- **Oh My Zsh** → `git pull` en `~/.oh-my-zsh`
- **Plugins ZSH** → `git pull` en cada plugin
- **Paquetes brew** → `brew upgrade <paquete>`

---

## 🔄 Después de cada cambio en el repo

```bash
source ~/.zshrc
```

> O usá el alias corto: `rs`

---

## 🔒 Hosts SSH privados (servidores de trabajo)

Los hosts privados **no se versionan**. Agregálos en un archivo local:

```bash
vim ~/.ssh/config.local
```

---

## 📁 Estructura

```plaintext
shellnest/
├── install.sh               # Instalador automático
├── shell/
│   ├── config/
│   │   ├── bash/            # Configuración Bash
│   │   └── zsh/.zshrc       # Configuración principal ZSH
│   ├── contexts/            # Aliases y funciones por proyecto
│   │   ├── colegium/
│   │   ├── cmt/
│   │   └── consorcio/
│   ├── git/git.sh           # Aliases y funciones git
│   ├── global/
│   │   ├── global.sh        # Aliases globales
│   │   └── variables.sh     # Variables de color compartidas
│   ├── images/              # ASCII art para la terminal
│   └── ssh/
│       ├── ssh.sh           # Funciones SSH (tunnel, ssh-hosts, etc.)
│       ├── config           # SSH config versionado
│       └── config.example   # Plantilla de referencia
├── git/
│   ├── .gitconfig
│   └── .gitignore_global
└── os/
    └── mac/                 # Configs macOS (iTerm2, Karabiner)
```
