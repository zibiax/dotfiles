#!/usr/bin/env sh


killall waybar
waybar -c "$HOME"/.config/waybar/config-HDMI-A-1.jsonc & # Waybar secondary
waybar -c "$HOME"/.config/waybar/config-DVI-D-1.jsonc & # Waybar rotated monitor
waybar -c "$HOME"/.config/waybar/config-dp-1.jsonc & # waybar primary

killall swaybg
swaybg -m fill -i ~/Pictures/Wallpapers/orig/mchouse.png
