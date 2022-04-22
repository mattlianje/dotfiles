#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get install sublime-text
    ;;

  darwin*)
    brew install --cask sublime-text
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac

