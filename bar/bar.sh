#!/bin/bash
# starts a bar
# accepts one arg (top or bottom)

cd $(dirname $0)

source fonts
source colors

spid=""
tfifo="$1.fifo"
interval=2

[ ! -d "$1" ] && exit 1

trap "kill $spid" SIGUSR1
trap "exit 1" SIGINT SIGTERM

[ -e "$tfifo" ] && rm "$tfifo"
mkfifo "$tfifo"

[ "$1" = "bottom" ] && flags="-b"

tail -f "$tfifo" | lemonbar -g "1888x28+1296+16" -f "$font_primary" -f "$font_mono" -f "$font_icon" -f "$font_icon_alt" $flags | sh &

while :; do
	$1/aggr.sh > $tfifo
	sleep $interval &
	spid=$!
	wait $spid
done

wait
