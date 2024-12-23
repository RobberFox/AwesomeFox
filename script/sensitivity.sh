#!/bin/bash
xset r rate 250 25
MOUSE_ID=$(xinput | grep "Cobra .* pointer" | sed '1!d' | cut -f 2 | cut -c 4-5)
SECOND_MOUSE_ID=$(xinput | grep "Cobra .* pointer" | sed '2!d' | cut -f 2 | cut -c 4-5)
xinput --set-prop $MOUSE_ID "Coordinate Transformation Matrix" 0.25 0 0 0 0.25 0 0 0 1
xinput --set-prop $SECOND_MOUSE_ID "Coordinate Transformation Matrix" 0.25 0 0 0 0.25 0 0 0 1
