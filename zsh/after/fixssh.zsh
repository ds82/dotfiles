addssh() {
  ag --depth=0 -l "BEGIN .* PRIVATE KEY" ~/.ssh | xargs ssh-add --apple-use-keychain --apple-load-keychain
}

fixssh() {
  SOCK=$(fd -p '.*ssh-.*/agent.*' /var/ /tmp/)
  if [[ ! -z "${SOCK}" ]]; then
    export SSH_AUTH_SOCK="$SOCK" 
    # echo "set SSH_AUTH_SOCK=${SOCK}"
  fi

  # for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
  #   if (tmux show-environment | grep "^${key}" > /dev/null); then
  #     value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
  #     export ${key}="${value}"
  #   fi
  # done
}

fixssh
