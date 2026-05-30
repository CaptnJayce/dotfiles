#!/usr/bin/env bash
# Auto-detects laptop vs desktop and launches waybar with the appropriate config.

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/waybar"

# Check for any battery device
if ls /sys/class/power_supply/BAT* >/dev/null 2>&1; then
    exec waybar --config "$CONFIG_DIR/config.laptop.jsonc"
else
    exec waybar --config "$CONFIG_DIR/config.jsonc"
fi
