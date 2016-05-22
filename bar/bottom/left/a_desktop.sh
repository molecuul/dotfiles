#!/bin/bash
# gets current desktop

cur=$(bspc query -D -d focused)

echo -n "$cur"
