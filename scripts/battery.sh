#!/bin/bash

battery=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$battery" -ge 80 ]; then
    emoji="🔋"
elif [ "$battery" -ge 50 ]; then
    emoji="🔋"
elif [ "$battery" -ge 20 ]; then
    emoji="🔋"
else
    emoji="🔋"
fi

echo "$emoji $battery%"
