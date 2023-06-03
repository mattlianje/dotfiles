#!/bin/bash

case $BLOCK_BUTTON in
  1) sudo brightnessctl -q set +10% ;;
  3) sudo brightnessctl -q set 10%- ;;
esac

bri=$(sudo brightnessctl -m | cut -d',' -f4)
echo "BRI: $bri"

