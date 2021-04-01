#!/bin/bash

source which-os
source dotfile-utils

case $PLATFORM in
  debian*)
    # not necessary
    # sudo apt-get install git -y
    ;;

  darwin*)
    brew install git
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac

custom_link "dotfiles/vimrc" "$HOME/.vimrc"

