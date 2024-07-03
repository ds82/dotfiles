## export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*,!node_modules/*"'
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history"

[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"


function fzf-homebrew-update() {
  brew install $(brew outdated | fzf --multi)
}
