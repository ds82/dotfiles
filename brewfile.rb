# use this file like this:
# brew bundle --file=./brewfile.rb
cask_args appdir: '/Applications'


brew 'glab'
brew 'hub'
brew 'tldr'
# brew 'nvm' # disabled, because its not supported by nvm and causes prefix errors
brew 'pandoc'
brew 'ranger'
brew 'atuin'
brew 'bitwarden'
brew 'raycast'
brew 'curseforge'

brew 'rustup-init'

# haskell
# brew 'ghc'
# brew 'cabal-install'
# brew 'haskell-stack'


cask 'colorpicker-skalacolor'
cask 'slack'
cask 'mailmate'
cask 'tunnelblick'
cask 'nvalt'
cask 'brave-browser'
cask 'utm'
cask 'bazecor'
cask 'steermouse'

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
