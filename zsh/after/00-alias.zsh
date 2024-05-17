if command -v brew &> /dev/null; then
  alias bru="brew update && brew upgrade --all"
fi

alias sleepnow='sudo pmset sleepnow && exit'

alias dns-clear="sudo killall -HUP mDNSResponder; sudo discoveryutil mdnsflushcache;sudo discoveryutil udnsflushcaches"

alias scan='pushd ~/code/ssdp-discover; ./node_modules/.bin/ts-node scan.ts; popd'

alias fix-perms='sudo chown -R dsaenger $WEB/node_modules $WEB/modules/*/packages/*/node_modules $WEB/packages/*/node_modules'

alias commit-cache="git add yarn.lock cache/ && git commit -m 'chore(lock/cache): update lock & cache'"

if command -v eza &> /dev/null; then
  alias ll='eza -a -l'
  alias ls='eza -l'
fi

# in linux fd is called fdfind; alias it
if command -v fdfind &> /dev/null; then
  alias fd=fdfind
fi


alias reflog='git reflog --pretty=raw | tig --pretty=raw'

alias dotenv="set -a; source .env; set +a"

alias n='nvim'
alias vim='nvim' # overwrite vim with nvim
alias r='ranger'
