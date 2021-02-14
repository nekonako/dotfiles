#!/usr/bin/env bash

# Init var
current_workspace="$(wmctrl -d | grep "*" | cut -d " " -f 1)"
previous_oppacity="$(cat ~/.config/tint2/tint2rc | sed -n 's/^.*\(#2b2b2b \)\(.*\)/\2/p')"

# Show icon
echo "/home/ekickx/.config/tint2/icons/amiyaa-menu.svg"

cat ~/.config/tint2/tint2rc | sed -i 's/\(#2b2b2b\)\(.*\)/\1 0/' ~/.config/tint2/tint2rc
for i in $(wmctrl -l | cut -d " " -f -3 | grep -E "(^|\s)"$current_workspace"($|\s)" | cut -d " " -f 1); do
  exist="$(xprop -id "$i" | grep "_NET_WM_STATE(ATOM)" | grep "MAXIMIZED_VERT" | grep "MAXIMIZED_HORZ" | grep -v "HIDDEN")"
  if [[ -n "$exist" ]]; then
    cat ~/.config/tint2/tint2rc | sed -i 's/\(#2b2b2b\)\(.*\)/\1 100/' ~/.config/tint2/tint2rc
  fi
done

current_opacity="$(cat ~/.config/tint2/tint2rc | sed -n 's/^.*\(#2b2b2b \)\(.*\)/\2/p')"
if [[ "$current_opacity" != "$previous_oppacity" ]]; then
  killall -SIGUSR1 tint2
fi
