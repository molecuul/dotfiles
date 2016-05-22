#!/bin/bash
# prints the current time

echo -n "%{T4}"
printf '\uF017 '
echo -n "%{T3}"

date +"%B %d %H:%M:%S"
