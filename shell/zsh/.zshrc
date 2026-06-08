# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export DOTFILES="$HOME/.dotfiles"

# =======================================================================================
# ZSH THEME
# =======================================================================================

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# =======================================================================================
# PLUGINS
# =======================================================================================

# UTILIZADOS:
# 1- autosuggestions: https://github.com/zsh-users/zsh-autosuggestions
## Sugiere comandos ya utilizados con aterioridad

# 2- highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
## Resalta comandos y resultados con coleres

# 3- tldr: brew install tldr
## Muestra resumen de comandos

# Video plugins: https://onedrive.live.com/?cid=1C5A9C77DFE4D4B9&id=1C5A9C77DFE4D4B9%21126154&parId=1C5A9C77DFE4D4B9%21126151&o=OneUp

# DEFINO PLUGINS A UTILIZAR
# Clonados en /Users/rodolfovenegas/.oh-my-zsh
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# PARA USAR ESTA INVOCACION DE PLUGIN DEBEN ESTAR CLONADOS EN /Users/rodolfovenegas/
# source /Users/rodolfovenegas/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /Users/rodolfovenegas/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


# =======================================================================================
# VARIABLES DE ENTORNO
# =======================================================================================

export PATH="/opt/homebrew/opt/php@8.2/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.2/sbin:$PATH"


# =======================================================================================
# IMPORTO ARCHIVO INDEX REDIRECCIONANDO A LOS ALIASES Y FUNCIONES
# =======================================================================================

source $DOTFILES/shell/_git/git.sh
source $DOTFILES/shell/_clg/clg.sh
source $DOTFILES/shell/_cns/cns.sh
source $DOTFILES/shell/_cmt/cmt.sh
source $DOTFILES/shell/_global/global.sh
source $DOTFILES/shell/_ssh/ssh.sh

# Para ver ejemplo de sintaxys de shell script
# https://devhints.io/bash


# STRING QUE SE MUESTRA AL INICIAR CONSOLA
# echo "Hola"
# cat .demonio #Imagen en consola


eval "$(/opt/homebrew/bin/brew shellenv)"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion"



# Add custom functions CMT
  source $HOME/.zsh_functions
  export PATH="$HOME/.yarn/bin:$PATH"
