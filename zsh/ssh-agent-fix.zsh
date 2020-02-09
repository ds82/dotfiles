fixssh() {
  for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
    if (tmux show-environment | grep "^${key}" > /dev/null); then
      value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
      export ${key}="${value}"
    fi
  done
}

addssh() {
  set -o shwordsplit
  files=$(find ~/.ssh -type f)
  for f in $files; do
    if grep -q "PRIVATE KEY"  "$f"; then
      ssh-add -K $f
    fi
  done
}
