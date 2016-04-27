#!/bin/bash

source $(dirname $0)/vars.sh

catch_int() {
	exit 1
}

trap catch_int SIGINT

$(dirname $0)/info.sh | lemonbar -f "$font_main" -f "$font_icon" -F "#FF000000" -B "#FF000000" -g 1280x10++ -n "wmbar" &

wid=$(xdo id -a "wmbar")
tries=10

while [ -z "$wif" -a "$tries" -gt 0 ]; do
	sleep 0.05
	wid=$(xdo id -a "wmbar")
	tries=$(($tries - 1))
done

if [[ -n "$wid" ]]; then
	xdo above -t "$(xdo id -N Bspwm -n root | sort | head -n 1)" "$wid"
fi

wait
