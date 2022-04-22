#!/bin/bash

source which-os
source echocolours

case $PLATFORM in
  debian*)
    curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs
    chmod +x cs
    ./cs setup
    ;;

  darwin*)
    brew install coursier/formulas/coursier
    cs setup
    ;;

  *)
    log_error "OS not supported"
    exit 1
    ;;

esac

