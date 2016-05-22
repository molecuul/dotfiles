#!/bin/bash
# Starts both bars

cd $(dirname $(readlink -f $0))

./bar.sh top &
./bar.sh bottom &
