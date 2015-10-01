if [[ -e ~/.github-token ]]; then
  TOKEN=$(cat ~/.github-token)
  export HOMEBREW_GITHUB_API_TOKEN=$TOKEN
fi
alias bru='brew update && brew upgrade --all'
