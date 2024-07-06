#!/bin/bash

icon() {
    if [ "$1" -lt 30 ]; then
        echo "🔈"
    elif [ "$1" -lt 70 ]; then
        echo "🔉"
    else
        echo "🔊"
    fi
}

# Get the current volume
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

echo "$(icon $volume) $volume%"

case $BLOCK_BUTTON in
    1) pactl set-sink-volume @DEFAULT_SINK@ +5% ;; 
    3) pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
esac
