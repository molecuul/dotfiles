#!/bin/bash
# loop for getting info

running=yes
spid=
delay=1

trap_sigint() {
	running=
	kill "$spid"
}

trap_sigusr1() {
	kill "$spid"
}

trap trap_sigint SIGINT
trap trap_sigusr1 SIGUSR1

while [ -n "$running" ]; do
	$(dirname $0)/feed.sh
	echo
	sleep "$delay" &
	spid=$!
	wait "$spid"
done
