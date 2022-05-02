#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    echo "rectangle does not apply to Debian";;

  darwin*)
    # Default settings OK.
    brew install --cask rectangle
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac
