# Install Caskroom

brew tap caskroom/cask

brew install brew-cask

brew tap caskroom/fonts
brew tap caskroom/versions

# Install packages

apps=(
  alfred
  atom
  caffeine
  flux
  dash
  gpgtools
  iterm2
  macvim
  mysqlworkbench
  sublime-text3
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
  font-sauce-code-powerline
  font-source-code-pro
  font-source-sans-pro
  font-source-serif-pro
  font-inconsolata
  font-hermit
)

brew cask install "${apps[@]}"
# Quicklook
brew cask install qlcolorcode qlmarkdown quicklook-json quicklook-csv qlstephen betterzipql
