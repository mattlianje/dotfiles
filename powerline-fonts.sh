#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    sudo apt-get install fonts-powerline
    ;;

  darwin*)
    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac



