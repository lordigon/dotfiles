#!/usr/bin/env bash
#source ./functions.sh

#sudo -v

# Keep-alive: update existing 'sudo' time stamp until script has finished
#while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Step 1: Update the OS and install Xcode tools
# print_info "Updating OSX. If it requires a restart, run the script again."
# Install all available updates
# sudo softwareupdate -iva

# Install only reccomended available updates
# sudo softwareupdate -irv

if ! xcode-select --print-path &> /dev/null; then

  print_info "Installing Command Line Tools"

  # Prompt user to install the Xcode Command Line Tools
  xcode-select --install &> /dev/null

  # Wait until the Xcode Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  print_result $? "Install Xcode Command Line Tools."

  # Point the `xcode-select` developer directory to
  # the appropriate directory from within `Xcode.app`
  # https://github.com/alrra/dotfiles/issues/13

  sudo xcode-select -switch "/Applications/Xcode.app/Contents/Developer"
  print_result $? 'Make "xcode-select" developer directory point to Xcode.'

  # Prompt user to agree to the terms of the Xcode license
  # https://github.com/alrra/dotfiles/issues/10

  sudo xcodebuild -license
  print_result $? 'Agree with the Xcode Command Line Tools licence'
fi
