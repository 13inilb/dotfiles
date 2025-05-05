#!/usr/bin/env bash

# Check if waybar is running
if pgrep -x "hyprpaper" > /dev/null; then
    # If running, kill the hyprpaper process
    pkill -x "hyprpaper" 
    # and start again
    hyprpaper &
else
    # If not running, start hyprpaper
    hyprpaper &
fi


