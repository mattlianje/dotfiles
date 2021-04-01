#!/bin/bash

source which-os

case $PLATFORM in
  debian*)
    log_info "TODO: Support Debian datagrip installation"
    ;;

  darwin*)
    brew install --cask datagrip
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac

