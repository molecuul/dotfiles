# xinitrc

wall="$HOME/images/walls/wall_winter.jpg"

xrdb "$HOME/.Xresources" &

# font fix
xset +fp "$HOME/.fonts" && xset fp rehash &

feh --bg-fill "$wall"

xcompmgr &
redshift 0.6:1.0 &

$HOME/.scripts/configure_displays.sh

if [ -n "$alt" ]; then
	openbox
	exit
fi

$HOME/.bar/bar.sh &

sxhkd &
bspwm -c "$HOME/.config/bspwm/bspwmrc"
