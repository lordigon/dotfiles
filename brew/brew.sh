#!/usr/bin/env bash
# Install Homebrew

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if test ! $(which brew)
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/bundle
brew tap homebrew/core
brew tap homebrew/dupes
brew tap homebrew/php

brew update
brew upgrade

formulas=(
  fish
  zsh
  zsh-completions
  fasd
  ncdu
  coreutils
  findutils
  moreutils
  gawk
  gnu-indent
  gnu-sed
  gnu-tar
  gnu-which
  gnutls
  grep
  rsync
  unzip
  less
  gzip
  bash
  bash-completions2
  homebrew/dupes/grep
  ack
  awscli
  git
  git-lfs
  git-extras
  tree
  mackup
  mas
  trash
  python
  python3
  'vim --override-system-vi'
  'mac-vim --with-override-system-vim'
  neovim/neovim/neovim
  reattach-to-user-namespace
  the_silver_searcher
  psgrep
  ripgrep
  wget
  tmux
  jq
)

for formula in "${formulas[@]}"; do
  if brew list "${formaula}" > /dev/null 2>&1; then
    echo "$formula already installed...skipping."
  else
    brew install $formula
  fi
done

brew cleanup

if ! grep -Fxq "/usr/local/bin/bash" /etc/shells; then
  # We installed the new shell, now we have to activate it
  echo "Adding the newly installed shell to the list of allowed shells"
  # Prompts for password
  sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
fi
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash
