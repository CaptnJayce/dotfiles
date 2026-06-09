#!/usr/bin/env bash
set -euo pipefail

# this is vibe-coded as fuck please don't yell at me if its bad (i wanted something quick)

WALLPAPER_DIR="${WALLPAPER_DIR:-$HOME/Pictures/wallpapers}"
STATE_DIR="$HOME/.local/share/wallpaper-state"
STATE_FILE="$STATE_DIR/state"

# Resolve the dotfiles repo root from this script's real path
SCRIPT_REAL="$(readlink -f "${BASH_SOURCE[0]}")"
REPO_ROOT="$(cd "$(dirname "$SCRIPT_REAL")/../../.." && pwd)"
DEFAULT_WALLPAPER="$REPO_ROOT/wallpapers/makima.png"

mkdir -p "$STATE_DIR"

# ── helpers ───────────────────────────────────────────

read_state() {
    ENABLED="enabled"
    INDEX="0"
    if [ ! -f "$STATE_FILE" ]; then
        return 0
    fi
    local lines=()
    while IFS= read -r line; do
        lines+=("$line")
    done < "$STATE_FILE"
    ENABLED="${lines[0]:-enabled}"
    INDEX="${lines[1]:-0}"
}

write_state() {
    printf '%s\n%d\n' "$ENABLED" "$INDEX" > "$STATE_FILE"
}

get_wallpapers() {
    if [ ! -d "$WALLPAPER_DIR" ]; then
        return 0
    fi
    find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) 2>/dev/null | sort
}

wallpaper_count() {
    get_wallpapers | wc -l
}

kill_wallpaper() {
    pkill -x swaybg 2>/dev/null || true
}

launch_wallpaper() {
    local count
    count="$(wallpaper_count)"

    local target
    if [ "$count" -eq 0 ]; then
        target="$DEFAULT_WALLPAPER"
    else
        INDEX=$((INDEX % count))
        if [ "$INDEX" -lt 0 ]; then
            INDEX=$((INDEX + count))
        fi
        local wallpapers=()
        while IFS= read -r w; do
            wallpapers+=("$w")
        done < <(get_wallpapers)
        target="${wallpapers[$INDEX]}"
    fi

    nohup swaybg -i "$target" -m fill >/dev/null 2>&1 &

    # Regenerate Material You colors from the new wallpaper
    if command -v matugen &>/dev/null; then
        matugen image "$target" >/dev/null 2>&1 || true
    fi
}

# ── commands ──────────────────────────────────────────

cmd_init() {
    read_state
    kill_wallpaper
    if [ "$ENABLED" = "enabled" ]; then
        launch_wallpaper
    fi
    write_state
}

cmd_toggle() {
    read_state
    kill_wallpaper
    if [ "$ENABLED" = "enabled" ]; then
        ENABLED="disabled"
    else
        ENABLED="enabled"
        launch_wallpaper
    fi
    write_state
}

cmd_next() {
    read_state
    if [ "$ENABLED" != "enabled" ]; then
        return
    fi
    INDEX=$((INDEX + 1))
    kill_wallpaper
    launch_wallpaper
    write_state
}

cmd_prev() {
    read_state
    if [ "$ENABLED" != "enabled" ]; then
        return
    fi
    INDEX=$((INDEX - 1))
    kill_wallpaper
    launch_wallpaper
    write_state
}

# ── main ──────────────────────────────────────────────

case "${1:-init}" in
    init)   cmd_init ;;
    toggle) cmd_toggle ;;
    next)   cmd_next ;;
    prev)   cmd_prev ;;
    *)
        echo "Usage: $0 {init|toggle|next|prev}"
        exit 1
        ;;
esac
