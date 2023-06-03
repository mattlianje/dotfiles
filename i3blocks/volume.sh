#!/bin/bash

case $BLOCK_BUTTON in
  1) pactl set-sink-volume @DEFAULT_SINK@ +5% ;; # Increase volume
  3) pactl set-sink-volume @DEFAULT_SINK@ -5% ;; # Decrease volume
esac

vol=$(pactl list sinks | awk '/^[[:space:]]Volume:/ { print $5 }' | head -n1)
echo "VOL: $vol"
