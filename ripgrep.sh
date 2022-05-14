#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    # not necessary
    sudo apt-get install ripgrep
    ;;

  darwin*)
    brew install ripgrep
    ;;

  *)
    log_error "Platform not supported"
    exit 1
    ;;

esac


