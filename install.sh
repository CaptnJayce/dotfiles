#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info()    { echo "  $1"; }
section() { echo; echo "▸ $1"; }

# System update
section "Updating system"
sudo pacman -Syu --noconfirm

# yay
if ! command -v yay &>/dev/null; then
    section "Installing yay"
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay-install
    (cd /tmp/yay-install && makepkg -si --noconfirm)
    rm -rf /tmp/yay-install
fi

# Packages
section "Installing packages"

PKGS=(
    # Editor
    neovim

    # CLI tools
    yazi
    git
    direnv
    stow
    hyprlock
    hyprshot
    brightnessctl
    playerctl

    # Dev — languages & runtimes
    nodejs
    npm
    bun
    ollama
    docker
    docker-compose
    tree-sitter-cli

    # Wayland / Hyprland ecosystem
    waybar
    mako
    swaybg
    hyprlauncher

    # Fonts
    ttf-roboto-mono-nerd

    # Apps
    discord
    lazygit
    obsidian
    firefox

    # Optional
    mullvad-vpn
    supabase-bin
)

yay -S --needed --noconfirm "${PKGS[@]}"

# Services
section "Enabling services"
sudo systemctl enable --now docker
sudo usermod -aG docker "$USER"
sudo systemctl enable --now ollama

# Shell
section "Setting default shell to fish"
chsh -s "$(command -v fish)"

# AI tools
section "Installing Claude Code"
bun add -g @anthropic-ai/claude-code

section "Installing opencode"
bun add -g opencode-ai

# Dotfiles
section "Symlinking dotfiles"
cd "$DOTFILES"

backup_conflicts() {
    local pkg="$1"
    [ -d "$pkg" ] || return
    find "$pkg" -type f | while read -r src; do
        local rel="${src#$pkg/}"
        local target="$HOME/$rel"
        if [ -f "$target" ] && [ ! -L "$target" ]; then
            mv "$target" "$target.backup"
            info "Backed up existing $target"
        fi
    done
}

mkdir -p ~/.config
for pkg in hypr fish kitty waybar mako fastfetch opencode; do
    backup_conflicts "$pkg"
done
stow -t ~ hypr fish kitty waybar mako fastfetch opencode

# Wallpapers
mkdir -p ~/Pictures
if [ -L ~/Pictures/wallpapers ] || [ -d ~/Pictures/wallpapers ]; then
    info "~/Pictures/wallpapers already exists — skipping"
else
    ln -sfn "$DOTFILES/wallpapers" ~/Pictures/wallpapers
fi

# salah-bar
section "Installing salah-bar"
if [ ! -d ~/.local/share/salah-bar ]; then
    git clone https://github.com/CaptnJayce/salah-bar ~/.local/share/salah-bar
    chmod +x ~/.local/share/salah-bar/salah_bar.py
else
    info "salah-bar already installed — skipping"
fi

# Ly
section "Configuring Ly"
if command -v ly &>/dev/null; then
    sudo mkdir -p /etc/ly
    sudo cp "$DOTFILES/ly/config.ini" /etc/ly/config.ini

    # Ensure no competing display manager is running or enabled
    if systemctl is-active --quiet sddm 2>/dev/null || systemctl is-enabled --quiet sddm 2>/dev/null; then
        sudo systemctl disable --now sddm
        info "sddm disabled"
    fi

    sudo systemctl enable ly
    info "ly enabled"
else
    info "ly not installed — skipping"
fi

# Done
echo
echo "Done. Log out and back in for shell + docker group changes to take effect."
