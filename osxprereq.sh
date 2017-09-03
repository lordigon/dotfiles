#!/usr/bin/env bash

if ! xcode-select --print-path &> /dev/null; then

  print_info "Installing Command Line Tools"

  # Unattended way to install XCode command line tools
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l |
    grep "\*.*Command Line" |
    head -n 1 | awk -F"*" '{print $2}' |
    sed -e 's/^ *//' |
    tr -d '\n')
  softwareupdate -i "$PROD";

  print_result $? "Install Xcode Command Line Tools."

  \rm -rf /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
fi
