unsetopt share_history

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
  alias cd=z
fi


