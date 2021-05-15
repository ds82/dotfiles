updateDevice() {
  IP=$1
  FILE=$2
  REBOOT=${3:-true}
  scp $FILE drkopf@$IP:/usr/reajet/public/service/update.hru
  [[ $REBOOT != "false" ]] && ssh drkopf@$IP 'sudo reboot'
}
