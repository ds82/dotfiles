export PATH=/usr/local/bin:$PATH

## fix alt cursor keys in console
bindkey -e

bindkey '[C' forward-word
bindkey '[D' backward-word

#bindkey "^[[1;5C" forward-word
#bindkey "^[[1;5D" backward-word

setopt no_share_history

export GIT_EDITOR='vim'

fixssh() {
  for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
    if (tmux show-environment | grep "^${key}" > /dev/null); then
      value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
      export ${key}="${value}"
    fi
  done
}
