# xinitrc

CURS="$HOME/.config/images/bcs.xbm"

# hide root window cursor
hide_curs() {
	sleep 0.25 # wait a tiny bit because I think i3 sets the root cursor and we want to make sure we do it afterwards
	xsetroot -cursor $CURS $CURS # same mask as cursor, all xparent anyway
}

# prep fonts
# if you want this font see github/Tecate/bitmap-fonts
xset +fp /usr/share/fonts/bitmap/kakwa
xset fp rehash

# load resdb
xrdb $HOME/.Xresources

# get terminals ready
urxvtd &

xcompmgr &
feh --bg-fill $HOME/.config/images/prim.jpg

hide_curs &

exec i3
