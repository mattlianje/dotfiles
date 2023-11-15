#!/bin/bash

# Function to retrieve the percentage of used RAM
get_ram_percentage() {
  used_ram=$(free | awk 'NR==2 {print $3}')
  total_ram=$(free | awk 'NR==2 {print $2}')
  ram_percentage=$((used_ram * 100 / total_ram))
  echo "RAM $ram_percentage%"
}

# Function to retrieve the percentage of CPU usage
get_cpu_percentage() {
  cpu_percentage=$(top -bn1 | awk 'NR>7 { sum += $9; } END { printf "CPU %.1f%%", sum / NR; }')
  echo "$cpu_percentage"
}

# Output the RAM and CPU percentages for i3blocks
case $BLOCK_NAME in
  ram)
    echo "$(get_ram_percentage)"
    echo "$(get_ram_percentage)"
    echo "#FFFFFF"
    ;;
  cpu)
    echo "$(get_cpu_percentage)"
    echo "$(get_cpu_percentage)"
    echo "#FFFFFF"
    ;;
  *)
    echo "Unknown Block"
    ;;
esac
