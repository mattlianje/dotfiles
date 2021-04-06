#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    sudo apt-get install openjdk-8-jdk -y
    ;;

  darwin*)
    brew install --cask adoptopenjdk8
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac

