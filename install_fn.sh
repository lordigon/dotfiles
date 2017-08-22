#!/bin/sh
##############################
# dotfiles functions script
#
# Author: Barisone Flavio
#
# Release Date: 31-07-2017
#
# Version: 1.0.0
#
# Directory structure
#
#
##############################

# Functions
print_error() {
  # Print output in red
  #printf "\e[0;31m  [✖] $1 $2\e[0m\n"
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
}

print_info() {
  # Print output in purple
  #printf "\n\e[0;35m $1\e[0m\n\n"
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

print_question() {
  # Print output in yellow
  #printf "\e[0;33m  [?] $1\e[0m"
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

print_result() {
  [ $1 -eq 0 ] \
    && print_success "$2" \
    || print_error "$2"

  [ "$3" == "true" ] && [ $1 -ne 0 ] \
    && exit
}

print_success() {
  # Print output in green
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
  #printf "\e[0;32m  [✔] $1\e[0m\n"
}

link_file() {
  if [ -e "$2" ]; then
    if [ "$(readlink "$2")" = "$1" ]; then
      print_success "skipped $1"
      return 0
    else
      mv "$2" "$2.backup"
      print_success "moved $2 to $2.backup"
    fi
  fi
  ln -sf "$1" "$2"
  print_success "linked $1 to $2"
}

source_file() {
  if [ -f "$1" ]; then
    source "$1"
  else 
    print_question "File $1 doesn't exist. Cannot source it."
  fi
}
