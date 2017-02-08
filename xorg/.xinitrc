# xinitrc

wall="$HOME/images/walls/wall_cityscape.jpg"
xrdb "$HOME/.Xresources" &

# font fix
xset +fp "$HOME/.fonts" && xset fp rehash &

feh --bg-fill "$wall"

xcompmgr &

if [ -n "$alt" ]; then
	openbox
	exit
fi

$HOME/.bar/bar.sh &

sxhkd &
[ -n "$min" ] && sleep 1 && $HOME/.scripts/term_ext.sh &
bspwm -c ~/.config/bspwm/bspwmrc
