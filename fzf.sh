#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    sudo apt-get install fzf
    ;;

  darwin*)
    brew install fzf
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac


