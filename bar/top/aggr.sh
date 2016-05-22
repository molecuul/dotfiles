#!/bin/env bash
# Aggregates all of the info from each module

echo -n "%{l}"

for i in $(dirname $0)/left/*; do
	[ -e "$i" ] && $i
	echo -n "  "
done

echo -n "%{c}"

for i in $(dirname $0)/center/*; do
	echo -n " "
	[ -e "$i" ] && $i
	echo -n "  "
done

echo -n "%{r}"

for i in $(dirname $0)/right/*; do
	echo -n "  "
	[ -e "$i" ] && $i
done

echo
