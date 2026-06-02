# dotfiles

These are my dotfiles. I use them on Arch Linux with Hyprland.

They're currently mainly vibecoded for POC and ease of tinkering. I'll manually re-implement everything once I've gotten them to a favourably stage.

## The theme

The colour scheme is called **Miko**, named after Yae Miko. The palette is built around her aesthetic: Purple and Sakura Pink against a deep midnight background with red highlights.

| Role          | Hex       |
| ------------- | --------- |
| Background    | `#0F0F1A` |
| Base          | `#151524` |
| Selection     | `#2D2D44` |
| Accent purple | `#9966CC` |
| Accent pink   | `#FFB7C5` |
| Accent red    | `#DC143C` |
| Text          | `#E8E8E8` |
| Muted text    | `#9090A8` |

Every tool uses the same hex codes with no compromise, if it doesn't yet - it will eventually.

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
- **hyprtoolkit** forces the Miko palette on Qt apps that respect it.
- Screenshots are bound to Print / Alt+Print / Shift+Print for output / window / region. They go to `~/Pictures/hyprshot/`.
