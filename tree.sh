#!/bin/bash

source which-os

case $PLATFORM in
  debian*)
    # not necessary: tree is packaged with Ubuntu.
    ;;

  darwin*)
     brew install tree
     ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac


