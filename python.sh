#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    sudo apt-get install python3.8 -y
    ;;

  darwin*)
    brew install pyenv
    pyenv install $(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1)
    pyenv global $(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1)
    brew install pip
    brew install jupyter
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac


