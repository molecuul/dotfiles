# xinitrc

wall="$HOME/images/walls/wall_cityscape.jpg"
xrdb "$HOME/.Xresources" &

# font fix
xset +fp "$HOME/.fonts" && xset fp rehash &

feh --bg-fill "$wall"

if [ -n "$alt" ]; then
	openbox
	exit
fi

sxhkd &
bspwm -c ~/.config/bspwm/bspwmrc
