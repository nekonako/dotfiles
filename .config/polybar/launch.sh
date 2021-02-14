#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar --config=/home/nako/.config/polybar/config-paper bottom &

exit 0
