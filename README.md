# dotfiles

These are my dotfiles. I use them on Arch Linux with Hyprland.

They're currently mainly vibecoded for POC and ease of tinkering. I'll manually re-implement everything once I've gotten them to a favourably stage.

## The theme

Colours are generated dynamically with [matugen](https://github.com/InioX/matugen) from the current wallpaper using Google's Material You algorithm. Switching wallpapers (Super+[/]) regenerates the palette and hot-reloads everything that supports it.

There is no hardcoded palette — the theme adapts to whatever wallpaper is set.

## What's in here

| Thing          | Name         |
| -------------- | ------------ |
| Window manager | Hyprland     |
| Lock screen    | Hyprlock     |
| Bar            | Waybar       |
| Notifications  | Mako         |
| Terminal       | Kitty        |
| Shell          | Fish         |
| Launcher       | Hyprlauncher |
| System info    | Fastfetch    |
| Code Editor    | VSCode       |
| Login manager  | Ly           |
| Wallpaper      | mpvpaper     |

## Also

- **salah-bar** shows prayer times in Waybar. Hardcoded to London coordinates. Change the lat/lon in the Waybar config if you live elsewhere.
- **hyprtoolkit** forces the generated Material You palette on Qt apps that respect it.
- Screenshots are bound to Print / Alt+Print / Shift+Print for output / window / region. They go to `~/Pictures/hyprshot/`.
