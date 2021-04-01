#!/bin/bash

source which-os

case $PLATFORM in
  debian*)
    wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
    sudo apt install ./slack-desktop-*.deb
    ;;

  darwin*)
    brew install --cask slack
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac

