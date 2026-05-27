#!/usr/bin/env bash
set -euo pipefail

dir=~/Pictures/wallpapers
monitor=$(hyprctl monitors -j | python3 -c "import json,sys; print(json.load(sys.stdin)[0]['name'])")
wallpaper=$(find "$dir" -maxdepth 1 -type f | shuf -n1)

exec mpvpaper -o "loop-file panscan=1.0" "$monitor" "$wallpaper"
