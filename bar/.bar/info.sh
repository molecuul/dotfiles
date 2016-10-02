#!/bin/bash
# quickly aggregates some info to put in the fifo

interval=5
sleep_pid=

# load vars
source $(dirname $0)/vars.sh

get_datetime() {
	format_default
	echo -n " $(date +'%b %d %H:%M:%S') "
}

get_batinfo() {
	batcur=$(acpi | cut -d ' ' -f 4 | grep -o '[0-9]*')
	battime=$(acpi | cut -d ' ' -f 5)

	format_good
	[ $batcur -lt 50 ] && format_default
	[ $batcur -lt 30 ] && format_bad

	echo -n " bat $batcur -> $battime "
}

get_desktop() {
	format_good
	echo -n " $(bspc query -D -d focused)"
	[ "$(bspc query -N -n focused)" != "" ] && echo -n '^'
	echo -n ' '
	format_default
}

get_netinfo() {
	format_good

	dev_wireless="wlp3s0"
	dev_wired="enp0s25"

	addr_wireless="$(ip -4 a s $dev_wireless | grep inet | cut -d ' ' -f 6)"
	addr_wired="$(ip -4 a s $dev_wired | grep inet | cut -d ' ' -f 6)"

	[ -n "$addr_wired" ] && echo -n " [$dev_wired: $addr_wired] "
	[ -n "$addr_wireless" ] && echo -n " [$dev_wireless: $addr_wireless] "

	format_default
}

get_music() {
	cur="$(mpc current -f %title%)"
	format_default

	if [ -n "$cur" ]; then
		format_good
		echo -n " mpd: $cur "
	else
		echo -n " stopped " 
	fi

	format_default
}

get_displaystate() {
	cur="$(cat $rt/scripts/display_state)"
	echo -n " display: $cur "
}

aggr() {
	format_left
	get_desktop
	get_batinfo
	get_music
	format_right
	get_displaystate
	get_netinfo
	get_datetime
}

wake() {
	kill $sleep_pid
}

trap wake SIGUSR1

while :; do
	aggr
	printf '\n'

	sleep $interval &
	sleep_pid=$!
	wait $sleep_pid
done
