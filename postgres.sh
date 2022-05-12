#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    sudo apt install postgresql postgresql-contrib
    ;;

  darwin*)
    brew install postgresql
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac


