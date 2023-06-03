#!/bin/bash

case $BLOCK_BUTTON in
  1) notify-send "Top memory-consuming processes" "$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 11)" ;;
  *) ps -eo cmd,%mem --sort=-%mem | head -n 2 | tail -n 1 ;;
esac
