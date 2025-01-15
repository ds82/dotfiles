if command -v docker &>/dev/null; then
  export CBIN=docker
elif command -v podman &>/dev/null; then
  export CBIN=podman
  alias docker=podman
fi



function dkill() {
  CONTAINER=$1
  $CBIN stop $CONTAINER
  $CBIN rm $CONTAINER
}

function dselect() {
  $CBIN ps -a |tail -n+2 | fzf --multi --color --ansi  --reverse | awk '{print $1}'
}

alias dps='$CBIN ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias dlog='$CBIN logs -f $(dselect)'
alias dinspect='$CBIN inspect $(dselect)'
alias dkill='dkill $(dselect)'
alias drm='$CBIN rm -f $(dselect)'

