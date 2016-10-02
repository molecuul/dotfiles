#!/bin/env bash
# sets some vars for the bar

# gap (match with bspwmrc please)
gap=10

# variables
usefont="creep:pixelsize=12"
geometry="$((1366 - $gap - $gap))x10+$gap+$gap"

color_fg_default="FFFFFFFF"
color_bg_default="00000000"

fg_default="%{F#$color_fg_default}"
bg_default="%{B#$color_bg_default}"

fg_good="%{F#00FFFF}"
bg_good=$bg_default

fg_bad="%{F#FFCC00}"
bg_bad=$bg_default

# macros for formatting
format_default() { echo -n "$fg_default$bg_default"; }
format_good() { echo -n "$fg_good$bg_good"; }
format_bad() { echo -n "$fg_bad$bg_bad"; }
format_invert() { echo -n "%{R}"; }

format_left() { echo -n "%{l}"; }
format_center() { echo -n "%{c}"; }
format_right() { echo -n "%{r}"; }

format_uline() { echo -n "%{!u}"; }
format_oline() { echo -n "%{!o}"; }
