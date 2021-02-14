#!/usr/bin/env bash

# Init variable
rofi_command="rofi -theme themes/prompt-amiyaa.rasi\
  -width 430px\ # You can adjust the width as you like
  -dmenu"
options="Suspend\nLogout\nReboot\nShutdown"
choice="$(echo -e "$options" | $rofi_command )"

# Options variable
suspend="systemctl suspend"
logout="xfce4-session-logout --logout"
reboot="systemctl reboot"
shutdown="systemctl poweroff"

# Ensure there is no other rofi's instance running
pkill rofi

# What to do when choice is chosen
case "$choice" in
  "Suspend") $suspend ;;
  "Logout") $logout ;;
  "Reboot") $reboot ;;
  "Shutdown") $shutdown ;;
esac
