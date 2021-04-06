#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt-get install google-chrome-stable -y
    ;;

  darwin*)
    brew install --cask google-chrome
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac

