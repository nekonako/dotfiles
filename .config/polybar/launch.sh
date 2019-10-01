#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar --config=/home/asuna/.config/polybar/config bottom &

exit 0
