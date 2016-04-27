#!/bin/bash
# Gets the current bspwm workspace.

printf '%s' "$(bspc query -D -d focused)"
