#!/bin/bash

source which-os

case $PLATFORM in
  debian*)
    sudo apt-get install tmux -y
    ;;

  darwin*)
    brew install tmux
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac

