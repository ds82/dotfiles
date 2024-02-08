export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')

PLUGIN_FILE=$HOME/code/dotfiles/zsh/plugins/zsh-nvm.plugin.zsh
if [ -f $PLUGIN_FILE ]; then
  . $PLUGIN_FILE
  plugins+=(zsh-nvm)
fi

