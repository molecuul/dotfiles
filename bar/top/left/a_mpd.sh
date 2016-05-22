#!/bin/env bash
# prints mpd info

progress_width=20
host=glados

source $(dirname $0)/../../colors

#printf '%%{T4}%[glados]%{T1} '

cur=$(mpc -h $host current -f '%artist% - %title%')

if [ -n "$cur" ]; then
	echo -n "$cur"
else
	echo -n "$host is not playing"
	exit 0
fi

elapsed=$($(dirname $0)/.a_mpd_time | cut -d ' ' -f 1)
total=$($(dirname $0)/.a_mpd_time | cut -d ' ' -f 2)

length_fill=$(python2 -c "from math import floor; print int(floor($elapsed * $progress_width / $total))")
length_rev=$(echo "$progress_width - ($length_fill + 1)" | bc)

if [ $length_fill -eq $progress_width ]; then
	length_fill=$(($progress_width - 1))
fi

echo -n " [$(mpc -h $host | grep '\[playing\]' | cut -d ' ' -f 5)]"

echo -n " %{T3}"

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

echo -n "$color_main%{T1}"
