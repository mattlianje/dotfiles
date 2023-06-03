#!/bin/bash

case $BLOCK_BUTTON in
    1) cinnamon-settings >/dev/null 2>&1 & ;; # Left mouse button
esac

echo "System Preferences"
