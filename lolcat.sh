#!/bin/bash

source which-os

case $PLATFORM in
  debian*)
    sudo apt-get install lolcat -y
    ;;

  darwin*)
    brew install lolcat
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac


