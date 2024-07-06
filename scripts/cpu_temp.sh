#!/bin/bash

temp=$(sensors | awk '/^Package id 0:/ {print $4}')

echo "🌡️CPU: $temp"
