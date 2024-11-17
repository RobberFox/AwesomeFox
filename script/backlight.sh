#!/bin/bash
MAXVAL=$(cat /sys/class/backlight/intel_backlight/max_brightness)
VAL=$(cat /sys/class/backlight/intel_backlight/brightness)
if [ "$1" = "+" ] ; then # $1 - positional argument
	VAL=`expr $VAL + $MAXVAL / 20`
	awk -v val="$VAL" -v maxval="$MAXVAL" 'BEGIN {
		result = 100 * val/maxval
		printf "%d%% \n", result
	}'
elif [ "$1" = "=" ] ; then
	awk -v val="$VAL" -v maxval="$MAXVAL" 'BEGIN {
		result = 100 * val/maxval
		printf "%d%% \n", result
	}'
else
	VAL=`expr $VAL - $MAXVAL / 20`
	awk -v val="$VAL" -v maxval="$MAXVAL" 'BEGIN {
		result = 100 * val/maxval
		printf "%d%% \n", result
	}'
fi

echo $VAL > /sys/class/backlight/intel_backlight/brightness
