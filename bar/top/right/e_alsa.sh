#!/bin/env bash
# prints mpd info

source $(dirname $0)/../../colors

progress_width=20
cur=$(amixer sget 'Master' | grep -o '[0-9]*\%' | grep -o '[0-9]*')

length_fill=$(python2 -c "from math import floor; print int(floor($cur * $progress_width / 100))")
length_rev=$(echo "$progress_width - ($length_fill + 1)" | bc)

if [ $length_fill -eq $progress_width ]; then
	length_fill=$(($progress_width - 1))
fi

echo -n "%{T4}"
printf '\uF028 '
echo -n "%{T3}"

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
