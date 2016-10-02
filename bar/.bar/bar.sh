#!/bin/env bash
# executes the bar

# get local path
usepath=$(dirname $0)

# load vars
source $usepath/vars.sh

# try to not leave anyone laying around
kill_all_jobs() { echo "terminating cleanly"; jobs -p | xargs kill; }
trap kill_all_jobs SIGINT SIGSEGV

lemonbar -F "#$color_fg_default" -B "#$color_bg_default" -f "$usefont" -g "$geometry" < $usepath/input.fifo &

while :; do
	$usepath/info.sh > $usepath/input.fifo
done

wait
