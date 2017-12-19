#!/usr/bin/env bash

source ./install_fn.sh

DOTFILES=$HOME/dotfiles

print_info "\nCreating symlinks"
print_info "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
        print_question "~${target#$HOME} already exists... Skipping."
    else
        print_info "Creating symlink for $file"
        ln -s $file $target
    fi
done

#print_info -e "\n\ninstalling to ~/.config"
#print_info "=============================="
#if [ ! -d $HOME/.config ]; then
#    print_info "Creating ~/.config"
#    mkdir -p $HOME/.config
#fi

#for config in $DOTFILES/config/*; do
#    target=$HOME/.config/$( basename $config )
#    if [ -e $target ]; then
#        print_question "~${target#$HOME} already exists... Skipping."
#    else
#        print_info "Creating symlink for $config"
#        ln -s $config $target
#    fi
#done

# create vim symlinks
# As I have moved off of vim as my full time editor in favor of neovim,
# I feel it doesn't make sense to leave my vimrc intact in the dotfiles repo
# as it is not really being actively maintained. However, I would still
# like to configure vim, so lets symlink ~/.vimrc and ~/.vim over to their
# neovim equivalent.

#print_info "\n\nCreating vim symlinks"
#print_info "=============================="
#VIMFILES=( "$HOME/.vim:$DOTFILES/vim/.vim"
#        "$HOME/.vimrc:$DOTFILES/vim/.vimrc" )

#for file in "${VIMFILES[@]}"; do
#    KEY=${file%%:*}
#    VALUE=${file#*:}
#    if [ -e ${KEY} ]; then
#        print_question "${KEY} already exists... skipping."
#    else
#        print_info "Creating symlink for $KEY"
#        ln -s ${VALUE} ${KEY}
#    fi
#done
