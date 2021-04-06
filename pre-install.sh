#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    sudo apt-get update
    ;;

  darwin*)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac


