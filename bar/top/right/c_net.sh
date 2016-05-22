#!/bin/env bash
# prints the network information

dev="enp6s0"

printf '%%{T4}\uF0EC%%{T2} '

output=$(ip addr show $dev | grep -o '[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\/[0-9]*')

if [ -n "$output" ]; then
	echo -n "$output"
else
	echo -n "$dev is down"
fi
