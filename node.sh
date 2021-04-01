#!/bin/bash

source which-os

case $PLATFORM in
  debian*)
    sudo apt-get install nodejs -y
    ;;

  darwin*)
    brew install node
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac

