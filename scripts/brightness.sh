#!/bin/bash

icon() {
    if [ "$1" -lt 30 ]; then
        echo "🌑"
    elif [ "$1" -lt 70 ]; then
        echo "🌕"
    else
        echo "☀️"
    fi
}

case $BLOCK_BUTTON in
  1) sudo brightnessctl -q set +10% ;;
  3) sudo brightnessctl -q set 10%- ;;
esac

bri=$(sudo brightnessctl -m | cut -d',' -f4 | tr -d '%')
icon=$(icon $bri)
echo "$icon $bri%"
