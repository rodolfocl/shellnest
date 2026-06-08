# 🐚 shellnest

Framework personal de configuración de shell para macOS. Gestiona aliases, funciones, configuración git y SSH, organizado por contexto de proyecto.

---

## 🚀 Mac nueva — un solo comando

```bash
git clone git@github.com:rodolfocl/shellnest.git ~/.shellnest && ~/.shellnest/install.sh
```

> Eso es todo. El script instala dependencias, plugins y crea los symlinks automáticamente.

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
│   ├── _git/git.sh          # Aliases y funciones git
│   ├── _clg/clg.sh          # Contexto Colegium
│   ├── _cmt/cmt.sh          # Contexto CMT
│   ├── _cns/cns.sh          # Contexto Consorcio
│   ├── _global/
│   │   ├── global.sh        # Aliases globales
│   │   └── variables.sh     # Variables de color compartidas
│   ├── _ssh/
│   │   ├── ssh.sh           # Funciones SSH (tunnel, ssh-hosts, etc.)
│   │   ├── config           # SSH config versionado
│   │   └── config.example   # Plantilla de referencia
│   └── zsh/.zshrc           # Configuración principal ZSH
├── git/
│   ├── .gitconfig
│   └── .gitignore_global
└── symlinks/links.sh        # Referencias de symlinks
```
