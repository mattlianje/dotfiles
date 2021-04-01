#!/bin/bash

# ------------------------------------------------------------------#
# UNIX-like local-dev setup                                         #
# @author: Matthieu Court (matthieu.court@protonmail.com)           #
# ------------------------------------------------------------------#

# You can define what will be installed.

ACTIONS = (
    # --- Pre-installation tasks ---
    pre-install

    # --- Packages ---
    git
    curl
    wget
    python
    java8
    scala
    sbt
    r
    minikube
    vim
    lolcat
    node
    tmux
    htop
    wireshark

    # --- Casks ---
    docker
    chrome
    firefox
    slack
    iterm2
    virtualbox
    intellij-idea
    datagrip
)


