#!/bin/sh
val=$(cat /sys/class/backlight/intel_backlight/brightness)
if [ "$1" = "+" ] ; then # $1 - positional argument
  val=`expr $val + 5000`
else
  val=`expr $val - 5000`
fi
echo $val > /sys/class/backlight/intel_backlight/brightness
