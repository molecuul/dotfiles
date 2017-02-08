#!/bin/bash
# Start a basic fullscreen terminal and then reset it

xrandr --output LVDS1 --mode 1366x768 --scale-from 683x384
bspc desktop -f m10
bspc config -m focused top_padding 0
bspc config -d focused border_width 0
bspc config -d focused window_gap 0
pkill xcompmgr
pkill lemonbar
urxvt
xrandr --output LVDS1 --mode 1366x768 --scale-from 1366x768
$HOME/.config/bspwm/bspwmrc
$HOME/.bar/bar.sh &!
xcompmgr &!
