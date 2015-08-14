TOKEN=$(cat ~/.github-token)
export HOMEBREW_GITHUB_API_TOKEN=$TOKEN
alias bru='brew update && brew upgrade --all'
