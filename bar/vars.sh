#!/bin/bash
# Sets some shell variables for usage with the statusbar.

font_main="lemon"
font_icon="Terminess Powerline-9"

f_fg_main="%{F#FF000000}"
f_bg_main="%{B#FFFFFFFF}"
f_fg_alt="%{F#FFFFFFFF}"
f_bg_alt="%{B#FF000000}"
f_bg_none="%{B#00F000000}"

f_use_underline="%{+u}"
f_disable_underline="%{-u}"

f_use_overline="%{+o}"
f_disable_overline="%{-o}"

f_powerline_left="\uE0B2"
f_powerline_right="\uE0B0"

use_fg_main() {
	printf '%s' "$f_fg_main"
}

use_bg_main() {
	printf '%s' "$f_bg_main"
}

use_fg_alt() {
	printf '%s' "$f_fg_alt"
}

use_bg_alt() {
	printf '%s' "$f_bg_alt"
}

use_bg_none() {
	printf '%s' "$f_bg_none"
}

use_underline() {
	printf '%s' "$f_use_underline"
}

disable_underline() {
	printf '%s' "$f_disable_underline"
}

use_overline() {
	printf '%s' "$f_use_overline"
}

disable_overline() {
	printf '%s' "$f_disable_overline"
}

powerline_left() {
	use_font_icon
	printf "$f_powerline_left"
	use_font_main
}

powerline_right() {
	use_font_icon
	printf "$f_powerline_right"
	use_font_main
}

use_font_main() {
	printf '%s' "%{T1}"
}

use_font_icon() {
	printf '%s' "%{T2}"
}
