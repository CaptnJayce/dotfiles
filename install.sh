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
    mpvpaper
    hyprlauncher

    # Fonts
    ttf-terminus-nerd

    # Apps
    discord
    visual-studio-code-bin
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

mkdir -p ~/.config
stow hypr fish kitty waybar mako fastfetch opencode

# VSCode extension — manual symlink since ~/.vscode is typically a real directory
mkdir -p ~/.vscode/extensions
if [ -L ~/.vscode/extensions/miko-theme ] || [ -d ~/.vscode/extensions/miko-theme ]; then
    info "miko-theme already exists — skipping"
else
    ln -sfn "$DOTFILES/vscode/.vscode/extensions/miko-theme" ~/.vscode/extensions/miko-theme
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
    sudo systemctl enable ly
    if systemctl is-active --quiet sddm; then
        sudo systemctl disable --now sddm
        info "sddm disabled"
    fi
    info "ly enabled"
else
    info "ly not installed — skipping"
fi

# Done
echo
echo "Done. Log out and back in for shell + docker group changes to take effect."
