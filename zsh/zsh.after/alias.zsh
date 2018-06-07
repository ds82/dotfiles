alias vmrun="/Applications/VMware\ Fusion.app/Contents/Library/vmrun"
alias bru="brew update && brew upgrade --all"
alias sleepnow='sudo pmset sleepnow && exit'

alias dns-clear="sudo killall -HUP mDNSResponder; sudo discoveryutil mdnsflushcache;sudo discoveryutil udnsflushcaches"

alias scan='pushd ~/code/ssdp-discover; ./node_modules/.bin/ts-node scan.ts; popd'
