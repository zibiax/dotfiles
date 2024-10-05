#!/bin/bash

get_icon() {
    local app_class=$1
    local icon=$(rofi -show icon -theme-str 'entry { enabled: false; }' -dmenu -i -p "Icon for $app_class" < /dev/null)
    echo -n "$icon "
}

get_workspace_icons() {
    hyprctl workspaces -j | jq -r '.[] | .id as $id | .windows[] | .class' | sort -u | while read -r class; do
        icon=$(get_icon "${class,,}")
        echo -n "$icon"
    done
}

get_workspace_icons
hyprctl onworkspacechange -j | while read -r; do
    get_workspace_icons
done
