#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#polybar --config=/home/asuna/.config/polybar/i3-solarized top
#polybar --config=/home/asuna/.config/polybar/i3-solarized bottom
polybar --config=/home/asuna/.config/polybar/i3-owl top &
polybar --config=/home/asuna/.config/polybar/i3-owl bottom &

exit 0
