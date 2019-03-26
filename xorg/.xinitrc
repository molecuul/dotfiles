#!/bin/env sh
# xinitrc

# set wallpaper
feh --bg-fill $HOME/.res/images/purple.png &

# start compositor
xcompmgr &

# prep fonts
(xset +fp $HOME/.res/fonts && xset fp rehash) &

# load xdb
xrdb $HOME/.Xresources &

# start bar
polybar main &

# start hotkeys
sxhkd -c $HOME/.config/sxhkd/sxhkdrc &

# start wm
bspwm -c $HOME/.config/bspwm/bspwmrc
