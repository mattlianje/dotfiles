#!/bin/bash

cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
ram_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | xargs printf "%.2f%%")

echo "🖥️ CPU: $cpu_usage | 🧠 RAM: $ram_usage"

case $BLOCK_BUTTON in
    1) notify-send "🖥️ CPU Usage" "$(top -bn1 | head -n 20)" ;;
    3) notify-send "🧠 RAM Usage" "$(ps aux --sort=-%mem | head -n 20)" ;;
esac
