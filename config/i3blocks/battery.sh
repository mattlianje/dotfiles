#!/bin/bash

BAT1=$(cat /sys/class/power_supply/BAT0/capacity)
BAT2=$(cat /sys/class/power_supply/BAT1/capacity)


echo "BAT-0: $BAT1% | BAT-1: $BAT2%" 

