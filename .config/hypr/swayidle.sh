#!/bin/env bash
#swayidle timeout 270 "~/.config/swaylock/lock.sh 50" \
#  timeout 300 'swaymsg "output * dpms off"' \
#  resume 'swaymsg "output * dpms on"'
timeout 10 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
timeout 15 'swaylock -f -c 000000'
