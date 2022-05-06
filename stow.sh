#!/bin/bash

source which-os
source dotfile-utils
source echocolours

case $PLATFORM in
  debian*)
    # not necessary
    sudo apt-get install -y stow
    ;;

  darwin*)
    brew install stow
    ;;

  *)
    log_error "Platform not supported"
    exit 1
    ;;

esac

