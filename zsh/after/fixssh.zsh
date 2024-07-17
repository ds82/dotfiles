addssh() {
  ag --depth=0 -l "BEGIN .* PRIVATE KEY" ~/.ssh | xargs ssh-add --apple-use-keychain --apple-load-keychain &>/dev/null
}

fixssh() {
  SSH_AGENT_PID=`ps x | grep ssh-agent | grep -v grep | head | awk '{print $1}'`

  # TODO: start ssh-agent if none is found

  # try to find SOCK via lsof
  # https://unix.stackexchange.com/questions/748105/connecting-to-currently-running-ssh-agent#:~:text=If%20you%20know%20the%20agent,would%20be%20the%20agent%20socket.
  # ... Typically, the file descriptor #3 would be the agent socket ...
  SOCK=`lsof -p ${SSH_AGENT_PID} 2>/dev/null | awk '{print $4 " " $8}' | grep -E '^3u' | awk '{print $2}'`
  if [[ ! -z "${SOCK}" ]]; then
    export SSH_AUTH_SOCK="$SOCK" 
    addssh
    return 0
  fi

  # otherwise try find
  SOCK=$(fd -1 -p '.*ssh-.*/agent.*' /var/ /tmp/)
  if [[ ! -z "${SOCK}" ]]; then
    export SSH_AUTH_SOCK="$SOCK" 
  fi

  # for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
  #   if (tmux show-environment | grep "^${key}" > /dev/null); then
  #     value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
  #     export ${key}="${value}"
  #   fi
  # done
}

fixssh
