#!/bin/bash
# prints a character amount for input 0-7

if [ $1 -ge 7 ]; then
	printf '\u2588'
elif [ $1 -ge 6 ]; then
	printf '\u2587'
elif [ $1 -ge 5 ]; then
	printf '\u2586'
elif [ $1 -ge 4 ]; then
	printf '\u2585'
elif [ $1 -ge 3 ]; then
	printf '\u2584'
elif [ $1 -ge 2 ]; then
	printf '\u2583'
elif [ $1 -ge 1 ]; then
	printf '\u2582'
else
	printf '\u2581'
fi
