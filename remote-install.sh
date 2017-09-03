#!/usr/bin/env bash
source ./install_fn.sh

[[ -x $(command -v wget) ]] && CMD="wget --no-check-certificate -O -"
[[ -x $(command -v curl) ]] > /dev/null 2>&1 && CMD="curl -#L"

if [ -z "$CMD" ]; then
  print_error "No curl or wget available. Aborting dotfiles installation."
else
  # Check if computer is connected to Internet
  echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 &>/dev/null
  if ! [ $? -eq 0 ]; then
    print_error "Machine must be connected to internet to download dotfiles."
    exit 1
  fi
  print_info "Installing dotfiles"
  mkdir -p "$HOME/.dotfiles" && \
  eval "$CMD https://github.com/lordigon/dotfiles/tarball/master  | tar -xzv -C $HOME/.dotfiles --strip-components=1 --exclude='{.gitignore}'"
  source "$HOME/.dotfiles/install.sh"
fi
