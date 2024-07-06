#!/bin/bash

weather=$(curl -s "wttr.in/?format=1")

echo "$weather"
