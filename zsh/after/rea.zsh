updateDevice() {
  IP=$1
  FILE=$2
  REBOOT=${3:-true}
  scp $FILE drkopf@$IP:/usr/reajet/public/service/update.hru
  SCP_SUCCESS=$0
  [[ "$SCP_SUCCESS" -eq 0 && $REBOOT != "false" ]] && ssh drkopf@$IP 'sudo reboot'
}

alias git-me-rea='git config user.name "Dennis Sänger" ; git config user.email "dsaenger@rea.de"'
