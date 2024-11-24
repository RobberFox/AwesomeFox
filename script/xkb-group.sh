#!/bin/bash

TOGGLE=$HOME/.toggle

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
	xkb-switch -s $1
else
    rm $TOGGLE
	xkb-switch -s $2
fi
