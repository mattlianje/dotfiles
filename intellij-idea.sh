#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    sudo snap install intellij-idea-ultimate --classic
    ;;

  darwin*)
    brew install --cask intellij-idea
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac

