addssh() {
  ag --depth=0 -l "BEGIN .* PRIVATE KEY" ~/.ssh | xargs ssh-add --apple-use-keychain --apple-load-keychain
}

fixssh() {
  for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
    if (tmux show-environment | grep "^${key}" > /dev/null); then
      value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
      export ${key}="${value}"
    fi
  done
}
