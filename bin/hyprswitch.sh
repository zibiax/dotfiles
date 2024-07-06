#!/bin/bash

# Paths to the configuration files
CONFIG_DIR="$HOME/.config/hypr"
CONFIG1="$CONFIG_DIR/config1.conf"
CONFIG2="$CONFIG_DIR/config2.conf"
HYPRLAND_CONF="$CONFIG_DIR/hyprland.conf"

# Function to switch configuration and move workspaces
switch_config() {
    if [ "$1" == "config1" ]; then
        cp "$CONFIG1" "$HYPRLAND_CONF"
        echo "Switched to config1"

        # Identify the correct socket path
        SOCKET_DIR=$(ls -d /run/user/$(id -u)/hypr/* 2>/dev/null | head -n 1)
        SOCKET_PATH="$SOCKET_DIR/.socket.sock"

        # Check if the socket path exists
        if [ ! -S "$SOCKET_PATH" ]; then
            echo "Socket path not found or is not a socket: $SOCKET_PATH"
            exit 1
        fi

        # Set the correct socket path
        export HYPRLAND_SOCKET="$SOCKET_PATH"

        # Debug output
        echo "Using socket path: $HYPRLAND_SOCKET"

        # Reload Hyprland to apply the new configuration
        hyprctl reload

        # Sleep for a short duration to allow the reload to complete
        sleep 2

        # Move all workspaces to the desired monitor (e.g., DP-1) when using config1
        TARGET_MONITOR="DP-1"

        # Move workspaces 1 through 10
        for WORKSPACE in {1..20}; do
            echo "Moving workspace $WORKSPACE to monitor $TARGET_MONITOR"
            hyprctl dispatch moveworkspacetomonitor $WORKSPACE $TARGET_MONITOR
        done

        echo "Moved all workspaces to $TARGET_MONITOR"

    elif [ "$1" == "config2" ]; then
        cp "$CONFIG2" "$HYPRLAND_CONF"
        echo "Switched to config2"

        # Identify the correct socket path
        SOCKET_DIR=$(ls -d /run/user/$(id -u)/hypr/* 2>/dev/null | head -n 1)
        SOCKET_PATH="$SOCKET_DIR/.socket.sock"

        # Check if the socket path exists
        if [ ! -S "$SOCKET_PATH" ]; then
            echo "Socket path not found or is not a socket: $SOCKET_PATH"
            exit 1
        fi

        # Set the correct socket path
        export HYPRLAND_SOCKET="$SOCKET_PATH"

        # Debug output
        echo "Using socket path: $HYPRLAND_SOCKET"

        # Reload Hyprland to apply the new configuration
        hyprctl reload

        # Sleep for a short duration to allow the reload to complete
        sleep 2

        # Define workspace-to-monitor mapping for config2
        declare -A WORKSPACE_TO_MONITOR=(
            [1]="DP-1"
            [2]="HDMI-A-1"
            [3]="DVI-D-1"
            [4]="DP-1"
            [5]="HMDI-A-1"
            [6]="DVI-D-1"
            [7]="DP-1"
            [8]="HDMI-A-1"
            [9]="DVI-D-1"
            [10]="DP-1"
        )

        # Move workspaces 1 through 10 according to the mapping
        for WORKSPACE in {1..10}; do
            TARGET_MONITOR="${WORKSPACE_TO_MONITOR[$WORKSPACE]}"
            if [ -n "$TARGET_MONITOR" ]; then
                echo "Moving workspace $WORKSPACE to monitor $TARGET_MONITOR"
                hyprctl dispatch moveworkspacetomonitor $WORKSPACE $TARGET_MONITOR
            else
                echo "No target monitor defined for workspace $WORKSPACE"
            fi
        done

        echo "Moved all workspaces according to config2 mapping"
    else
        echo "Invalid argument. Use 'config1' or 'config2'."
        exit 1
    fi
}

# Check if argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 [config1|config2]"
    exit 1
fi

# Call the function with the argument
switch_config "$1"

