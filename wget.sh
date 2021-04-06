#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    sudo apt-get install wget -y
    ;;

  darwin*)
    brew install wget
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac


