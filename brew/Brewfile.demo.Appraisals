# Install ZSH
brew 'zsh'
brew 'zsh-completions'

# Install GNU core utilities (those that come with macOS are outdated)
brew 'coreutils'

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew 'findutils'

brew 'moreutils'

# Install Bash 4
brew 'bash'
brew 'bash-completions2'

# Install more recent versions of some macOS tools
brew 'homebrew/dupes/grep'

# Install Binaries
brew 'ack'
brew 'awscli'
brew 'git'
#brew install exiv2
brew 'git-lfs'
brew 'git-extras'
# brew 'hub' - Wrapper a Git che semplifica il suo utilizzo con GitHub
brew 'tree'
# brew 'node'
brew 'mackup'
# Creazione del file vi ~/.mackup.cfg per configurare l'engine cloud dove salvare i settaggi
# [storage]
# engine = icloud
brew 'mas'
brew 'trash'
brew 'wget'
brew 'jq'

# Development

# Apps
cask 'alfred'
cask 'atom'
cask 'caffeine'
cask 'flux'
cask 'dash'
cask 'gpgtools'
cask 'iterm2'
cask 'macvim'
cask 'mysqlworkbench'
cask 'sublime-text3'
cask 'tower'
cask 'docker'
cask 'virtualbox'
cask 'virtualbox-extension-pack'
cask 'vagrant'
cask 'vlc'

# Quicklook
cask 'qlcolorcode'
cask 'qlmarkdown'
cask 'quicklook-json'
cask 'quicklook-csv'
cask 'qlstephen'
cask 'betterzipql'

# Fonts
cask 'font-sauce-code-powerline'
cask 'font-source-code-pro'
cask 'font-source-sans-pro'
cask 'font-source-serif-pro'
cask 'font-inconsolata'
cask 'font-hermit'

# brew 'php71', args: ['with-debug']
# brew 'php71-intl'
# brew 'mariadb'

# cask 'aerial' - Scrren saver as AppleTV
# cask 'dropbox'
# cask 'firefox'
# cask 'google-backup-and-sync'
# cask 'google-chrome'
# cask 'transmit'
# cask 'phpstorm'
# cask 'quip' - App euqls to Slack
# cask 'sequel-pro' - MySQL tool
# cask 'shuttle' - SSH shortcut menu application
# cask 'slack'

# Install Mac App Store apps
# mas '1Password', id: 443987910
# mas 'Magnet', id: 441258766
# mas 'Ulysses', id: 623795237
# mas 'Things3', id: 904280696
# mas 'Tweetbot', id: 557168941
# mas 'Pocket', id: 568494494
# mas 'Caffeine', id: 411246225
# mas 'Reeder', id: 880001334
# mas 'iA Writer', id: 775737590


# mas 'Byword', id: 420212497
# mas 'Deckset', id: 847496013
# mas 'Gapplin', id: 768053424
# mas 'Giphy Capture', id: 668208984
# mas 'Paw', id: 584653203
# mas 'Sip', id: 507257563
# mas 'Sketch', id: 402476602




#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# Remove outdated versions from the cellar.
brew cleanup

