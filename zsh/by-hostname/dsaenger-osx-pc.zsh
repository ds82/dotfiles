export FW=/Users/dsaenger/code/firmware
export WEB=/Users/dsaenger/code/titan-web
export TGW=$WEB/titan-gui-web
export TGN=$WEB/titan-nodedaemon

alias grl='git checkout -- $FW/titan-gui-languages'

# include proxy settings
# source ~/.proxy

export PATH=$PATH:/usr/local/Cellar/ruby/2.0.0-p0/bin/
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig

export PATH=$PATH:/Users/dsaenger/bin/arcanist/arcanist/bin

ssh-dev() {
  ssh -A drkopf@192.168.100.$1
}

ssh-rea() {
  ssh -A drkopf@172.16.22.$1
}

deviceBackupFolder="/Users/dsaenger/rea-jet-public"

backup-dev() {
  IP=192.168.100.$1
  today=$(date +"%Y-%m-%d")
  mkdir -p $deviceBackupFolder/$IP/$today/
  scp -r drkopf@$IP:/usr/reajet/public $deviceBackupFolder/$IP/$today/
}

updateDevice() {
  scp $2 drkopf@$1:/usr/reajet/public/service/update.hru && ssh drkopf@$1 'sudo reboot'
}

# gerrit alias
alias gerrit='ssh -p 29418 -i ~/.ssh/rea gerrit gerrit'
alias gerrit-create-branch='gerrit create-branch titan-web user/$USER/$(git rev-parse --abbrev-ref HEAD) $(git merge-base master HEAD)'

