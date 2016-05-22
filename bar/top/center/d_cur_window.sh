#!/bin/env bash
# prints the current window title

echo -n "$(xdotool getactivewindow getwindowname)"
