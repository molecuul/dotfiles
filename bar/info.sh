#!/bin/bash

source $(dirname $0)/vars.sh

modules="modules"
modules_alt="modules_alt"

interval=0.2
toggle=0
colors="cc6464 cc8064 cccc64 80cc64 64cc64 64cc80 64cccc 6480cc 6464cc 8064cc cc64cc cc6480"
#colors="0055dd"

sleep_pid=

kill_sleep() {
	kill $sleep_pid
}

catch_int() {
	exit 1
}

trap kill_sleep SIGUSR1
trap catch_int SIGINT

while :; do
	for color in $colors; do
		f_bg_main=$(printf '%%{B#%s}' "$color")
		f_fg_alt=$(printf '%%{F#%s}' "$color")

		bspc config -m focused focused_border_color "#$color"
		bspc config -m focused normal_border_color "#$color"
		bspc config -m focused active_border_color "#$color"
		bspc config -m focused presel_feedback_color "#$color"

		use_fg_main
		use_bg_main

		toggle=0
		printf '%s' "%{l}"

		for i in $(dirname $0)/"$modules"/*; do
			output=$($i)

			if [[ $? -ne 0 ]]; then
				continue
			fi

			printf ' %s ' "$output"

			if [[ $toggle -eq 0 ]]; then
				use_fg_alt
				use_bg_alt
				toggle=1
			else
				use_fg_main
				use_bg_main
				toggle=0
			fi

			powerline_right
		done

		for i in {1..100}; do
			printf '                    '
		done

		printf '%s' "%{r}"

		for i in $(dirname $0)/"$modules_alt"/*; do
			output=$($i)

			if [[ $? -ne 0 ]]; then
				continue
			fi

			powerline_left

			if [[ $toggle -eq 0 ]]; then
				use_fg_alt
				use_bg_alt
				toggle=1
			else
				use_fg_main
				use_bg_main
				toggle=0
			fi

			printf ' %s ' "$output"
		done

		if [[ $toggle -eq 0 ]]; then
			use_fg_alt
			use_bg_alt
		else
			use_fg_main
			use_bg_main
		fi

		printf '\n'

		sleep $interval &
		sleep_pid=$!
		wait $sleep_pid
	done
done
