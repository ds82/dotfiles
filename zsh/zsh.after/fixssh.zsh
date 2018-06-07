addssh() {
  ssh-add -K ~/.ssh/rea; ssh-add -K ~/.ssh/id_rsa; ssh-add -K ~/.ssh/bd_rsa
}

fixssh() {
  for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
    if (tmux show-environment | grep "^${key}" > /dev/null); then
      value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
      export ${key}="${value}"
    fi
  done
}
