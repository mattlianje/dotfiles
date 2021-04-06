#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    log_info "NA: iterm2 not applicable for linux OS flavours"
    ;;

  darwin*)
    brew install --cask iterm2
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac


