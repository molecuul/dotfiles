#!/bin/env bash
# prints mpd info

source $(dirname $0)/../../colors

progress_width=20
total=$(grep MemTotal /proc/meminfo | sed -r 's/\ +/\ /g' | cut -d ' ' -f 2)
cur=$(( $total - $(grep MemAvailable /proc/meminfo | sed -r 's/\ +/\ /g' | cut -d ' ' -f 2)))
cur_gb=$(echo "scale=1; $cur / 1048576" | bc)
total_gb=$(echo "scale=1; $total / 1048576" | bc)

length_fill=$(python2 -c "from math import floor; print int(floor($cur * $progress_width / $total))")
length_rev=$(echo "$progress_width - ($length_fill + 1)" | bc)

if [ $length_fill -eq $progress_width ]; then
	length_fill=$(($progress_width - 1))
fi

echo -n "%{T4}"
printf '\uF1C0 '
echo -n "%{T3}"

printf '%0.1f / %0.1f GB ' "$cur_gb" "$total_gb"

i=0
while [ $i -lt $length_fill ]; do
	printf '\u2500'
	i=$(($i + 1))
done

printf '\u2524'
echo -n "$color_dark"

i=0
while [ $i -lt $length_rev ]; do
	printf '\u2500'
	i=$(($i + 1))
done

echo -n "$color_main"
echo -n "%{T1}"
