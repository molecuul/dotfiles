#!/bin/bash
# Gets the current mpd info.

song=$(mpc -f "%title%" current)

if [[ ! -n "$song" ]]; then
	song="stopped"
fi

printf '%s' "$song"
