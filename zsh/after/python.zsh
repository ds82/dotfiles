if command -v pyenv &>/dev/null; then
  export PATH=$(pyenv root)/shims:$PATH
fi
