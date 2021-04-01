#!/bin/bash

source which-os

case $PLATFORM in
  debian*)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ;;

  darwin*)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac


