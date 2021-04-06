#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    sudo apt-get install python3.8 -y
    ;;

  darwin*)
    brew install pyenv
    brew install python
    brew install pip
    brew install jupyter
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac


