#!/usr/bin/env bash
set -euo pipefail

monitor=$(hyprctl monitors -j | python3 -c "import json,sys; print(json.load(sys.stdin)[0]['name'])")
exec mpvpaper -o "loop-file" "$monitor" ~/Pictures/dots/wallpaper.mp4
