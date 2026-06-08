# 🐚 shellnest

Framework personal de configuración de shell para macOS. Gestiona aliases, funciones, configuración git y SSH, organizado por contexto de proyecto.

---

## 📦 Instalación

### Mac nueva

Si no tienes el repo todavía, clona e instala con un solo comando:

```sh
git clone git@github.com:rodolfocl/shellnest.git ~/.shellnest && ~/.shellnest/install.sh
```

> 📋 Puedes copiar el comando con el botón que aparece arriba a la derecha del bloque.

Esto descarga el repo y ejecuta el instalador automáticamente.

---

### Ya tienes el repo clonado

Si el repo ya existe en `~/.shellnest` (por ejemplo, después de reorganizar archivos o en una reinstalación), solo corre el instalador:

```sh
~/.shellnest/install.sh
```

Responde `N` a la pregunta de actualizar. El script recrea los symlinks y verifica que todo esté instalado.

---

### Actualizar paquetes existentes

Para actualizar Homebrew, Oh My Zsh, plugins y paquetes brew:

```sh
~/.shellnest/install.sh --update
```

O corre `install.sh` sin argumentos y responde `y` a la pregunta inicial.

Qué actualiza:

- **Homebrew** → `brew update`
- **Oh My Zsh** → `git pull` en `~/.oh-my-zsh`
- **Plugins ZSH** → `git pull` en cada plugin
- **Paquetes brew** → `brew upgrade <paquete>`

---

### 🚨 Emergencia — eliminar symlinks y reinstalar desde cero

```sh
rm -f ~/.zshrc ~/.bashrc ~/.bash_profile ~/.gitconfig ~/.gitignore_global ~/.ssh/config && ~/.shellnest/install.sh
```

> Elimina los enlaces simbólicos (no los archivos del repo) y reinstala.

---

## 🔄 Después de cada cambio en el repo

```sh
source ~/.zshrc
```

> O usa el alias corto: `rs`

---

## 🔒 Hosts SSH privados (servidores de trabajo)

Los hosts privados **no se versionan**. Agrégalos en un archivo local:

```sh
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
