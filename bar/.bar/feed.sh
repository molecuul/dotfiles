#!/bin/bash
# information feed for new bar

col_inactive="#FF777777"
col_active="#FF33AA33"
col_active_empty="#FF3333AA"
col_network="#FF33AAAA"

col_quality_first="#FFCC3333"
col_quality_second="#FFCCCC33"
col_quality_third="#FF777777"
col_quality_fourth="#FF33CC33"
col_quality_fifth="#FF3333CC"

col_bat1="#FFCC3333"
col_bat2="#FFCC5533"
col_bat3="#FFCC7733"
col_bat4="#FFCC9933"
col_bat5="#FFCCAA33"
col_bat6="#FFAACC33"
col_bat7="#FF99CC33"
col_bat8="#FF77CC33"
col_bat9="#FF55CC33"
col_bat10="#FF33CC33"

font_def() {
	echo -n "%{T1}"
}

font_icon() {
	echo -n "%{T2}"
}

fg_col() {
	printf "%%{F%s}" "$1"
}

fg_col() {
	printf "%%{B%s}" "$1"
}

u_col() {
	printf "%%{U%s}" "$1"
}

u_set() {
	echo -n "%{+u}"
}

u_unset() {
	echo -n "%{-u}"
}

align_left() {
	echo -n "%{l}"
}

align_center() {
	echo -n "%{c}"
}

align_right() {
	echo -n "%{r}"
}

pad_mod() {
	echo -n " "
	$1
	echo -n " "
}

col_quality() {
	font_icon

	cur=$(echo $1 | cut -d'/' -f1)
	max=$(echo $1 | cut -d'/' -f2)

	thres_first=$(echo "$max/5" | bc)
	thres_second=$(echo "($max*2)/5" | bc)
	thres_third=$(echo "($max*3)/5" | bc)
	thres_fourth=$(echo "($max*4)/5" | bc)

	if [ $cur -lt $thres_first ]; then
		u_col $col_quality_first
	elif [ $cur -lt $thres_second ]; then
		u_col $col_quality_second
	elif [ $cur -lt $thres_third ]; then
		u_col $col_quality_third
	elif [ $cur -lt $thres_fourth ]; then
		u_col $col_quality_fourth
	else
		u_col $col_quality_fifth
	fi

	font_def
}

col_battery() {
	font_icon

	cur=$(acpi | grep -o '[0-9]*\%' | grep -o '[0-9]*')
	max=100

	if [ $cur -lt $(echo "($max*1/10)" | bc) ]; then
		u_col $col_bat1
	elif [ $cur -lt $(echo "($max*2/10)" | bc) ]; then
		u_col $col_bat2
	elif [ $cur -lt $(echo "($max*3/10)" | bc) ]; then
		u_col $col_bat3
	elif [ $cur -lt $(echo "($max*4/10)" | bc) ]; then
		u_col $col_bat4
	elif [ $cur -lt $(echo "($max*5/10)" | bc) ]; then
		u_col $col_bat5
	elif [ $cur -lt $(echo "($max*6/10)" | bc) ]; then
		u_col $col_bat6
	elif [ $cur -lt $(echo "($max*7/10)" | bc) ]; then
		u_col $col_bat7
	elif [ $cur -lt $(echo "($max*8/10)" | bc) ]; then
		u_col $col_bat8
	elif [ $cur -lt $(echo "($max*9/10)" | bc) ]; then
		u_col $col_bat9
	else
		u_col $col_bat10
	fi

	font_def
}

feed_desktop() {
	dstate="$(bspc wm -g | sed -r 's/\:/\n/g')"
	for i in $dstate; do
		name=${i:1}
		case "$i" in
		o*)
			u_unset
			u_col $col_inactive
			echo -n " $name "
			u_unset
		;;
		O*)
			u_set
			u_col $col_active
			echo -n " $name "
			u_unset
		;;
		f*)
		;;
		F*)
			u_set
			u_col $col_active_empty
			echo -n " $name "
			u_unset
		;;
		*)
			continue
		;;
		esac
	done
}

feed_time() {
	cur_date=$(date +'%b %d %H:%M:%S')
	echo -n "$cur_date"
}

feed_window() {
	cur_window="$(xdotool getactivewindow getwindowname)"
	echo -n "$cur_window"
}

feed_bat() {
	bat=$(acpi | cut -d',' -f2- | sed -r 's/\,/\ \|/g')
	u_set
	col_battery
	echo -n "$bat"
	u_unset
}

feed_network() {
	dev_wired="enp0s25"
	dev_wireless="wlp3s0"

	addr_wired="$(ip -4 a s $dev_wired | grep inet | cut -d ' ' -f 6)"
	addr_wireless="$(ip -4 a s $dev_wireless | grep inet | cut -d ' ' -f 6)"

	if [ -n "$addr_wireless" ]; then
		quality=$(iwconfig $dev_wireless | grep Quality | cut -d' ' -f12 | cut -d'=' -f2)
		echo -n " "
		col_quality "$quality"
		u_set
		echo -n "$dev_wireless: $addr_wireless"
		u_unset
		echo -n " "
	fi

	if [ -n "$addr_wired" ]; then
		echo -n " "
		u_col $col_network
		u_set
		echo -n "$dev_wired: $addr_wired"
		u_unset
		echo -n " "
	fi
}

align_left
pad_mod feed_desktop

align_center
pad_mod feed_window

align_right
pad_mod feed_network
pad_mod feed_bat
pad_mod feed_time
