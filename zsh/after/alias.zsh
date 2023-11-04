alias bru="brew update && brew upgrade --all"
alias sleepnow='sudo pmset sleepnow && exit'

alias dns-clear="sudo killall -HUP mDNSResponder; sudo discoveryutil mdnsflushcache;sudo discoveryutil udnsflushcaches"

alias scan='pushd ~/code/ssdp-discover; ./node_modules/.bin/ts-node scan.ts; popd'

alias fix-perms='sudo chown -R dsaenger $WEB/node_modules $WEB/modules/*/packages/*/node_modules $WEB/packages/*/node_modules'

alias commit-cache="git add yarn.lock cache/ && git commit -m 'chore(lock/cache): update lock & cache'"

alias ll='eza -a -l'
alias ls='eza -l'

alias reflog='git reflog --pretty=raw | tig --pretty=raw'

alias dotenv="set -a; source .env; set +a"

alias n='nvim'
alias r='ranger'
