#!/bin/bash

source which-os
source dotfile-utils
source echocolours

case $PLATFORM in
  debian*)
    log_info "TODO: support Docker Debian setup"
    ;;

  darwin*)
    brew install --cask docker
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac

