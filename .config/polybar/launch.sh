#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar --config=/home/yune/.config/polybar/config bottom &

exit 0
