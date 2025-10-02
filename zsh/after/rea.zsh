updateDevice() {
  IP=$1
  FILE=$2
  REBOOT=${3:-true}

  # check if we can login without password
  ssh -o PasswordAuthentication=no drkopf@$IP /bin/true &>/dev/null

  if [ $? -ne 0 ]; then
    echo "Could not login without password - using ssh-copy-id" 
    ssh-copy-id drkopf@$IP

    if [ $? -ne 0 ]; then
      echo "Could not login without password - exiting"
      return 1
    fi
  fi


  scp $FILE drkopf@$IP:/usr/reajet/public/service/update.hru
  SCP_SUCCESS=$0
  [[ "$SCP_SUCCESS" -eq 0 && $REBOOT != "false" ]] && ssh drkopf@$IP 'sudo reboot'
}

downloadFirmware() {
  BUILD=$1
  rsync -avP re-devsrv01:/mnt/inchgower_public/firmware/by-build-number/$BUILD/*$BUILD*.hru ~/Downloads/
  
}

installBuild() {
  IP=$1
  BUILD=$2
  HRU_FULE=$(find $HOME/Downloads -iname "update*${BUILD}*.hru" -print -quit)

  if [[ -z "$HRU_FULE" ]]; then
    downloadFirmware $BUILD
    HRU_FULE=$(find ~/Downloads -iname "update*${BUILD}*.hru" -print -quit)
  fi

  updateDevice $IP $HRU_FULE
}


alias git-me-rea='git config user.name "Dennis Sänger" ; git config user.email "dsaenger@rea.de"'
