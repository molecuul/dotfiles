#!/bin/bash
# bar init hold

font_def="creep:pixelsize=12"
font_icon="Siji:pixelsize=12"
fg_def="#FF999999"
bg_def="#77333333"

$(dirname $0)/info.sh | lemonbar -f "$font_def" -f "$font_icon" -F "$fg_def" -B "$bg_def"
