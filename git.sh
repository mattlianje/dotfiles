#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    # not necessary
    # sudo apt-get install git -y
    ;;

  darwin*)
    brew install git
    ;;

  *)
    log_error "Platform not supported"
    exit 1
    ;;

esac

