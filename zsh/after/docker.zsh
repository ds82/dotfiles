export CBIN=$(command -v docker || command -v podman)

function dkill() {
  CONTAINER=$1
  $CBIN stop $CONTAINER
  $CBIN rm $CONTAINER
}

function dselect() {
  $CBIN ps -a --format="{{.Names}}" | fzf
}

alias dps='$CBIN ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias dlog='$CBIN logs -f $(dselect)'
alias dinspect='$CBIN inspect $(dselect)'
alias dkill='dkill $(dselect)'

