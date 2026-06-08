#================================================================
# IMPORTO VARIABLES GLOBALES
source $SHELLNEST/shell/_global/variables.sh
#================================================================


# ALIASES ================================

alias git="git "
alias lg="log --oneline --decorate --all --graph"
alias st="git status -s -b"
alias pd="pretty-diff"
alias pl="pretty-log"
#alias undo="undo-last-commit" # funcion git
alias undo="reset HEAD~1 --mixed" # Deshace el utimo commit manteniendo los cambios

# FUNCTIONS ================================

function pretty-diff() {
  ##? Ver git diff con un previsualizador de los cambios en la terminal
  ##? Utilizando fzf: brew install fzf
  ##?  1.0.0
  ##?
  ##? Usage:
  ##? pretty-diff, al dar enter en un archivomodificado copia el path del archivo

  if (! git rev-parse HEAD >/dev/null 2>&1 ); then
    echo "\n${DGRAY}============================================${NC}"
    echo "${YELLOW}Este directorio no es un repositorio de GIT!${YELLOW}"
    echo "${DGRAY}============================================${NC}\n"
  else
    git -c color.status=always status --short |
    fzf --height 100% --ansi \
      --preview '(git diff HEAD --color=always -- {-1} | sed 1,4d)' \
      --preview-window right:65% |
    cut -c4- |
    sed 's/.* -> //' |
    tr -d '\n' |
    pbcopy
  fi

}

function pretty-log() {
  ##? Git log filtering con fzf
  ##? Utilizando fzf: brew install fzf
  ##?
  ##? Usage:
  ##? pretty-log, al dar enter en un commmit copia el id del commit seleccionado

  if (! git rev-parse HEAD >/dev/null 2>&1 ); then
      echo "\n${DGRAY}============================================${NC}"
      echo "${YELLOW}Este directorio no es un repositorio de GIT!${YELLOW}"
      echo "${DGRAY}============================================${NC}\n"
  else
    commit=$(
      git log --graph \
        --color=always \
        --date=human \
        --format="%C(auto)%h%d %s %C(black)%C(bold)%ad by %an" |
        fzf --ansi --no-sort \
          --preview '(git diff-tree --no-commit-id --name-status -r {2})' \
          --preview-window right:35%
      )
      commit_hash=$(echo ${commit} | awk '{print $2}')
      echo ${commit_hash} | tr -d '\n' | pbcopy
  fi
}

function show-ignored() {
  ##? Show all ignored files
  #?? 1.0.0
  ##?
  ##? Usage:
  ##? show-ignored

  git status --ignored -s | grep "\!\!"
}

function find-msg-commit() {
  ##? Find commits by commit message
  #?? 1.0.0
  ##?
  ##? Usage:
  ##? find "message to find"

  git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short --regexp-ignore-case --grep=$1
}

function standup() {
  ##? Muestra utltimos commit realizados por dias con su fecha y respectiva hora
  #?? 1.0.0
  ##?
  ##? Usage:
  ##? standup

  docs::eval "$@"

  git log --reverse --branches --since=$(if [[ "Mon" == "$(date +%a)" ]]; then echo "last friday"; else echo "yesterday"; fi) --author=$(git config --get user.email) --format=format:'%C(cyan) %ad %C(yellow)%h %Creset %s %Cgreen%d' --date=local
}

function revert-last-commit() {
  ##? Crea nuevo commit deshaciendo el commit anteior, que lo invierta, si eliminanos un archivo este nuevo commit lo agregara,
  ##? manteniendo los commit en el historico, agregando un nuevo commit con la inversion.
  ##! OJO: Elimina el trabajo reralizado del working tree y staging area.
  #?? Sirve para respeter el historico
  #?? 1.0.0
  ##?
  ##? Usage:
  ##? revert-last-commit
  git revert @
}

function undo-last-commit() {
  ##? Quita el utltimo commit realizado (del historico), manteniendo los cambios en el Working Tree (antes del staging)
  ##? Para deshacer este commit no debe haber sido pusheado, de lo contrario se debera resolver conflictos con el repositorio remoto
  #?? 1.0.0
  ##?
  ##? Usage:
  ##? undo-last-commit
  echo "Ultimo commit deshecho 🤷🏻‍♂️\n"
  git reset HEAD~1 --mixed
}