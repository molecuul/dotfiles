# xinitrc

wall="$HOME/images/walls/wall_fog.jpg"

xrdb "$HOME/.Xresources" &

# font fix
xset +fp "$HOME/.fonts" && xset fp rehash &

feh --bg-fill "$wall"

xcompmgr &
redshift 0.6:1.0 &

if [ -n "$alt" ]; then
	openbox
	exit
fi

sxhkd &
bspwm -c "$HOME/.config/bspwm/bspwmrc"
