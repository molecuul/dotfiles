#!/bin/bash
# Gets the title of the current window.

title=$(xdotool getactivewindow getwindowname)

if [[ ! -n "$title" ]]; then
	title="desktop"
fi

printf '%s' "$title"
