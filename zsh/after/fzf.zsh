## export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*,!node_modules/*"'
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history"

[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"


function fzf-homebrew-update() {
  brew update && brew install $(brew outdated | fzf --multi --reverse --bind '?:preview:brew info {}')
}

function fzf-glab-mr-list {
  glab mr list \
      | awk -F\t 'NR>2 {printf "\033[1;32m%s\t\033[00m\033[1;33m%s\t\033[00m\033[1;34m%s\033[00m\t\033[00m\033[1;36m%s\033[00m\n", $1, $2, $3, $4;}' \
      | column -s$'\t' -t \
      | fzf --color --ansi \
      | awk '{print $1}' \
      | sed -E 's/!([0-9]+)/\1/'
}

function fzf-glab-mr-co() {
  glab mr checkout $(glab mr list \
    | awk -F\t 'NR>2 {printf "\033[1;32m%s\t\033[00m\033[1;33m%s\t\033[00m\033[1;34m%s\033[00m\t\033[00m\033[1;36m%s\033[00m\n", $1, $2, $3, $4;}' \
    | column -s$'\t' -t \
    | fzf --color --ansi \
    | awk '{print $1}' \
    | sed -E 's/!([0-9]+)/\1/')
}

function fzf-kill() {
  local pid
  pid=$(ps -ef | fzf --height 40% --reverse --inline-info --multi \
    | awk '{print $2}')
  if [[ -n "$pid" ]]; then
    echo "Killing $pid"
    echo "$pid" | xargs kill -9
  fi 
}
alias fkill=fzf-kill
