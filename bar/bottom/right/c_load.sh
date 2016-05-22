#!/bin/bash
# computes load averages and makes a kinda graph

source $(dirname $0)/../../colors

cur_waiting=$(vmstat | tail -n 1 | cut -d ' ' -f 2)
load_one=$(uptime | cut -d ' ' -f 11 | sed 's/\,//')
load_five=$(uptime | cut -d ' ' -f 12 | sed 's/\,//')
load_fifteen=$(uptime | cut -d ' ' -f 13 | sed 's/\,//')

load_max=8

amt_waiting=$(echo "scale=0; $cur_waiting * 8 / $load_max" | bc)
amt_one=$(echo "scale=0; ($load_one * 8) / $load_max" | bc)
amt_five=$(echo "scale=0; ($load_five * 8) / $load_max" | bc)
amt_fifteen=$(echo "scale=0; ($load_fifteen * 8) / $load_max" | bc)

echo -n "%{T4}$color_main"
printf '\uF06D '

echo -n "%{T3}$color_main"
$(dirname $0)/.char_amt.sh $amt_waiting
echo -n "$color_dark "
$(dirname $0)/.char_amt.sh $amt_one
echo -n " "
$(dirname $0)/.char_amt.sh $amt_five
echo -n " "
$(dirname $0)/.char_amt.sh $amt_fifteen
echo -n "$color_main"
