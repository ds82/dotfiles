export WEB=$HOME/code/titan-web
export FW=$HOME/code/firmare

# force ESLINT_D (nvim) to use local eslint
export ESLINT_D_LOCAL_ESLINT_ONLY=1

# add ~/.local/bin to PATH
LOCAL_BIN=$HOME/.local/bin
if [[ -d $LOCAL_BIN ]]; then
  export PATH=$LOCAL_BIN:$PATH
fi
