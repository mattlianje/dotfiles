#!/bin/bash

source which-os

case $PLATFORM in
  debian*)
    sudo apt-get install htop -y
    ;;

  darwin*)
    brew install htop
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac

