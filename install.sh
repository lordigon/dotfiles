#!/usr/bin/env bash
##############################
# dotfiles installation script
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

source ./functions.sh

main() {
  # Get the dotfiles directory's absolute path
  SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"
  DOTFILES_DIR="$(dirname "${SCRIPT_DIR}")"
  # Example:
  # SCRIPT_DIR:   /Users/mario/dotfiles
  # DOTFILES_DIR: /Users/mario/
  DOTFILE_DIR_NAME=.dotfiles
  DOTFILE_DIR_BACKUP_NAME=.dotfiles_bck

  # -n parameter do not actually make any filesystem changes
  declare -rx stow="stow -n"

  print_info "${SCRIPT_DIR}"

  export SCRIPT_DIR
  export DOTFILES_DIR


  # Check that DOTFILES_DIR
  #if ! [ "${DOTFILES_DIR}" = "${HOME}/${DOTFILE_DIR_NAME}" ]; then
  #  print_error "Script root directory must be ${HOME}/${DOTFILE_DIR_NAME}."
  #  exit 1
  #fi

  DARWIN=false
  LINUX=false

  # Check Operating System
  if test "$(uname)" = "Darwin"; then
    DARWIN=true
    LINUX=false
  else
  #if [ test "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    DARWIN=false
    LINUX=true
  fi

  export DARWIN
  export LINUX

  dotfiledir="${HOME}/{${DOTFILES_DIR}"                        # dotfiles directory
  dotfiledir_bck="${HOME}/${DOTFILE_DIR_BACKUP_NAME}"             # old dotfiles backup directory

  # Backup file esistenti
  # Create dotfiles_old in homedir
  print_info "Creating ${dotfiledir_bck} for backup of any existing dotfiles in ${HOME}..."
  mkdir -p "${dotfiledir_bck}"

  declare -a FILES_TO_SYMLINK=(
    'zsh/.shell_aliases'
    'zsh/.shell_config'
    'zsh/.shell_exports'
    'zsh/.shell_functions'
    'zsh/.zshrc'
    'bash/.bash_profile'
    'bash/.bash_prompt'
    'bash/.bashrc'
    'ack/.ackrc'
    'curl/.curlrc'
    'gem/.gemrc'
    'input/.inputrc'
    'screen/.screenrc'
    'git/.gitattributes'
    'git/.gitconfig'
    'git/.gitignore_global'
  )

  print_info "Moving any existing dotfiles from ~ to ${dotfiledir_bck}"

  for i in ${FILES_TO_SYMLINK[@]}; do
    file=${i##*/}
    if [ -f ~/${file} ]; then
      print_info "Moving file" ${file}
      #mv ~/${i##*/} ${dotfiledir_bck}
    fi
  done


  # Update Homebrew recipes
  print_info "Updating brew"
  brew update
  print_info "Upgrading brew"
  brew upgrade

  # Install all our dependencies with bundle (See Brewfile)
  brew tap homebrew/bundle
  print_info "Install brew recipes and cask applications"
  # brew bundle

  brew cleanup

  # Stow dot files..
  print_info "stow ack file/s"
  ${stow} ack
  print_info "stow bash file/s"
  ${stow} bash
  print_info "stow curl file/s"
  ${stow} curl
  print_info "stow gem file/s"
  ${stow} gem
  print_info "stow input file/s"
  ${stow} input
  print_info "stow screen file/s"
  ${stow} screen
  print_info "stow git file/s"
  ${stow} git
  print_info "stow zsh file/s"
  ${stow} zsh

  # Add specific application installations. Every folder can contain install.sh file to
  # install application specific stuff and ._app_aliases file to source specific application alias.
  declare -a APP_FOLDER=(
    'docker'
    #'maven'
    #'java'
  )

  for i in ${APP_FOLDER[@]}; do
    app=${i##*/}
    app_aliases=".${app}_aliases"
    folder="${SCRIPT_DIR}/${app}"
    if [ -d "${folder}" ]; then
      print_info "${folder}/install.sh"
      [ -f "./${app}/install.sh" ] && sh -c "./${app}/install.sh"
      if [ -f "./${app}"/"${app_aliases}" ]; then
        ${stow} "${app}"
        # link_file "${folder}"/"${app_aliases}" "${DOTFILES_DIR}"/"${app_aliases}"
        source_file "${DOTFILES_DIR}"/"${app_aliases}"
      fi
    fi
  done

  # Switch to using brew-installed bash as default shell
  #if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  #  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  #  chsh -s /usr/local/bin/bash;
  #fi;
}


#### EXECUTE MAIN FUNCTION ####
main "$@"


# Make ZSH the default shell environment
# chsh -s $(which zsh)

# Install Composer
# curl -sS https://getcomposer.org/installer | php
# mv composer.phar /usr/local/bin/composer

# Install global Composer packages
# /usr/local/bin/composer global require laravel/installer laravel/lumen-installer laravel/valet tightenco/jigsaw spatie/http-status-check bramus/mixed-content-scan laravel/spark-installer

# Install Laravel Valet
# $HOME/.composer/vendor/bin/valet install

# Install global NPM packages
#npm install --global yarn

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
#mkdir $HOME/Sites

# Set macOS preferences
# We will run this last because this will reload the shell
#source .macos

