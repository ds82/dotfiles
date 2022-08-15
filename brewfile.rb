# use this file like this:
# brew bundle --file=./brewfile.rb
cask_args appdir: '/Applications'


tap 'caskroom/cask'
tap 'caskroom/fonts'

brew 'neovim'
brew 'git'
brew 'git-extras'
brew 'hub'
brew 'ag'
brew 'jq'
brew 'fzf'
brew 'tmux'
brew 'tig'
brew 'curl'
brew 'nmap'
brew 'tcpdump'
brew 'entr'
brew 'gawk'
brew 'htop'
brew 'ncdu'
brew 'rsync'
brew 'tldr'
brew 'zsh'
brew 'wget'
# brew 'nvm' # disabled, because its not supported by nvm and causes prefix errors
brew 'pandoc'

brew 'mas'

# haskell
# brew 'ghc'
# brew 'cabal-install'
# brew 'haskell-stack'

cask 'spotify'
cask 'vlc'

cask 'iterm2'
cask 'dash'
cask 'alfred'
cask 'docker'
cask 'owncloud'
cask 'colorpicker-skalacolor'
cask 'appcleaner'
cask 'keepingyouawake'
cask 'discord'
cask 'slack'
cask 'google-chrome'
cask 'visual-studio-code'
cask 'mailmate'
cask 'phoenix'
cask 'gpg-suite'
cask 'tunnelblick'
cask 'hazel'
cask 'istat-menus'
cask 'nvalt'
cask 'brave-browser'

# Quicklook
cask 'qlcolorcode'
cask 'qlmarkdown'
cask 'quicklook-json'
cask 'qlstephen'

# mas
mas 'Affinity Photo', id: 824183456
mas 'Affinity Designe', id: 824171161
# mas 'Keka', id: 470158793
# mas 'Marked 2', id: 890031187
# mas 'Reeder', id: 880001334

# Fonts
cask 'font-lato'
cask 'font-open-sans'
cask 'font-roboto'
cask 'font-source-code-pro-for-powerline'
cask 'font-source-code-pro'
cask 'font-source-sans-pro'
cask 'font-source-serif-pro'
