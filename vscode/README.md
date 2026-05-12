# Miko Theme

A dark colour theme inspired by Yae Miko — midnight backgrounds with pink, purple, and rose accents.

Part of [CaptnJayce's dotfiles](https://github.com/CaptnJayce/dotfiles). Designed to match the Miko palette used across Hyprland, Kitty, Waybar, and Neovim.

## Palette

| Role | Hex |
|---|---|
| Background | `#0f0f1a` |
| Background (dark) | `#0a0a12` |
| Foreground | `#e8e8e8` |
| Primary accent | `#ffb7c5` (pink) |
| Secondary accent | `#9966cc` (purple) |
| Warning | `#e05780` (rose) |
| Error | `#dc143c` (red) |
| String | `#57c47f` (green) |
| Type | `#b090e0` (bright purple) |
| Comment | `#5c5c7c` |

## Installation

### From VSIX

```bash
npm install -g @vscode/vsce
vsce package
code --install-extension miko-theme-0.1.0.vsix
```

### From source (dotfiles)

```bash
ln -sf ~/dotfiles/vscode ~/.vscode/extensions/miko-theme
```

## Related

- [Kitty Miko palette](../kitty/miko.conf)
- [Neovim Miko colourscheme](../nvim/colors/miko.lua)
- [Hyprland Miko palette](../hypr/hyprtoolkit.conf)
