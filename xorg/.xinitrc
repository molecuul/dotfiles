#!/bin/env sh
# xinitrc

# prep fonts
xset +fp /usr/share/fonts/cherry
xset fp rehash

# load xdb
xrdb $HOME/.Xresources

# start wm
exec awesome
