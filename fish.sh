#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    sudo apt-get install fish
    ;;

  darwin*)
    brew install fish;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac




