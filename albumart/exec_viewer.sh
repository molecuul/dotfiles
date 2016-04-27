#!/bin/bash
# Starts feh and regularly updates with glados radio album art.

interval=3

feh -B black -R $interval --scale-down --title "GLaDOS art" http://10.0.3.1:2516/art
