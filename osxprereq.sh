#!/usr/bin/env bash

if ! xcode-select --print-path &> /dev/null; then


  # Unattended way to install XCode command line tools
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l |
    grep "\*.*Command Line" |
    head -n 1 | awk -F"*" '{print $2}' |
    sed -e 's/^ *//' |
    tr -d '\n')
  softwareupdate -i "$PROD";

  \rm -rf /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

  # Update Command Line Tools to High Sierra
  PROD=$(softwareupdate -l |
    grep "\*.*Command Line" |
    head -n 1 | awk -F"*" '{print $2}' |
    sed -e 's/^ *//' |
    tr -d '\n')
  softwareupdate -i "$PROD";
  
fi
