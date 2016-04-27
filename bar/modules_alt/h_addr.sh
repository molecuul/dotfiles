#!/bin/bash
# Gets the network address for wlp2s0.

device="enp6s0"

if [[ ! -n "$(ip link show $device up)" ]]; then
	printf '%s down' "$device"
	exit 0
fi

addr=$(ip addr show "$device" | grep inet | grep -v inet6 | cut -d ' ' -f 6)
printf '%s %s' "$device" "$addr"
