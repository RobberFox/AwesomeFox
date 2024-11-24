#!/bin/bash

if [ "$(xkb-switch)" = "$1" ]; then
	xkb-switch -s $2
else
	xkb-switch -s $1
fi
