file="$(hostname -s).zsh"
if [[ -s "$HOME/.yadr/zsh/by-hostname/$file" ]]; then
  source "$HOME/.yadr/zsh/by-hostname/$file"
fi
