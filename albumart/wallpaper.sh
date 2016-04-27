#!/bin/bash
# Sets the wallpaper to something cool every once in a while

interval=3
change_interval=1
url="http://10.0.3.1:2516/blur"

last_title=""

while :; do
	current_title=$(mpc -h glados -f %title% current)

	if [[ "$current_title" != "$last_title" ]]; then
		echo "Change detected from [$last_title] to [$current_title], changing in $change_interval seconds"
		last_title="$current_title"
		sleep $change_interval
		feh --bg-fill $url
	fi

	sleep $interval
done
