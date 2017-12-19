# Install Caskroom

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions

# Install packages

apps=(
  alfred
  atom
  caffeine
  flux
  dash
  gpg-suite
  iterm2
  macvim
  mysqlworkbench
  sublime-text
  keka
  keycastr
  tower
  macdown
  docker
  beyond-compare
  virtualbox
  virtualbox-extension-pack
  vagrant
  vlc
  font-source-code-pro
  font-source-sans-pro
  font-source-serif-pro
  font-inconsolata
  font-inconsolata-nerd-font
  font-inconsolata-nerd-font-mono
  font-hermit
  font-hermit-nerd-font
  font-hermit-nerd-font-mono
)

brew cask install "${apps[@]}"
# Quicklook
# brew cask install qlcolorcode qlmarkdown quicklook-json quicklook-csv qlstephen betterzipql
brew cask install qlcolorcode qlmarkdown quicklook-json quicklook-csv qlstephen
