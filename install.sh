#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info()    { echo "  $1"; }
section() { echo; echo "▸ $1"; }

# ── system update ─────────────────────────────────────────────────────────────
section "Updating system"
sudo pacman -Syu --noconfirm

# ── yay ───────────────────────────────────────────────────────────────────────
if ! command -v yay &>/dev/null; then
    section "Installing yay"
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay-install
    (cd /tmp/yay-install && makepkg -si --noconfirm)
    rm -rf /tmp/yay-install
fi

# ── packages ──────────────────────────────────────────────────────────────────
section "Installing packages"

PKGS=(
    # Editor
    neovim

    # CLI tools
    yazi
    git
    direnv
    python-requests

    # Dev — languages & runtimes
    nodejs
    npm
    bun
    ollama
    docker
    docker-compose
    tree-sitter-cli

    # Apps
    discord
    visual-studio-code-bin
    obsidian
    firefox

    # ── Optional ──────────────────────────────────────────────────────────────
    mullvad-vpn
    supabase-bin
)

yay -S --needed --noconfirm "${PKGS[@]}"

# ── services ──────────────────────────────────────────────────────────────────
section "Enabling services"
sudo systemctl enable --now docker
sudo usermod -aG docker "$USER"
sudo systemctl enable --now ollama

# ── shell ─────────────────────────────────────────────────────────────────────
section "Setting default shell to fish"
chsh -s "$(command -v fish)"

# ── ai tools ──────────────────────────────────────────────────────────────────
section "Installing Claude Code"
bun add -g @anthropic-ai/claude-code

section "Installing opencode"
bun add -g opencode-ai

# ── dotfiles ──────────────────────────────────────────────────────────────────
section "Symlinking dotfiles"

mkdir -p \
    ~/.config/hypr \
    ~/.config/fish \
    ~/.config/kitty \
    ~/.config/mako \
    ~/.config/waybar \
    ~/.config/fastfetch \
    ~/.config/opencode/themes \
    ~/.vscode/extensions

ln -sf "$DOTFILES/hypr/hyprland.conf"     ~/.config/hypr/hyprland.conf
ln -sf "$DOTFILES/hypr/wallpaper.sh"     ~/.config/hypr/wallpaper.sh
ln -sf "$DOTFILES/hypr/hyprlauncher.conf" ~/.config/hypr/hyprlauncher.conf
ln -sf "$DOTFILES/hypr/hyprtoolkit.conf"  ~/.config/hypr/hyprtoolkit.conf
ln -sf "$DOTFILES/kitty/kitty.conf"       ~/.config/kitty/kitty.conf
ln -sf "$DOTFILES/kitty/miko.conf"        ~/.config/kitty/miko.conf
ln -sf "$DOTFILES/mako/config"            ~/.config/mako/config
ln -sf "$DOTFILES/waybar/config.jsonc"    ~/.config/waybar/config.jsonc
ln -sf "$DOTFILES/waybar/style.css"       ~/.config/waybar/style.css
ln -sf "$DOTFILES/fish/config.fish"       ~/.config/fish/config.fish
ln -sf "$DOTFILES/fastfetch/config.jsonc" ~/.config/fastfetch/config.jsonc
ln -sf "$DOTFILES/opencode/themes/miko.json"    ~/.config/opencode/themes/miko.json

# VSCode — symlink the Miko theme extension
if [ -d ~/.vscode/extensions/miko-theme ]; then
    info "~/.vscode/extensions/miko-theme already exists — skipping"
else
    ln -sfn "$DOTFILES/vscode" ~/.vscode/extensions/miko-theme
fi

# ── salah-bar ─────────────────────────────────────────────────────────────────
section "Installing salah-bar"
if [ ! -d ~/.local/share/salah-bar ]; then
    git clone https://github.com/CaptnJayce/salah-bar ~/.local/share/salah-bar
    chmod +x ~/.local/share/salah-bar/salah_bar.py
else
    info "salah-bar already installed — skipping"
fi

# ── ly ────────────────────────────────────────────────────────────────────────
section "Configuring Ly"
if command -v ly &>/dev/null; then
    sudo mkdir -p /etc/ly
    sudo cp "$DOTFILES/ly/blackhole.dur" /etc/ly/blackhole.dur
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

# ── done ──────────────────────────────────────────────────────────────────────
echo
echo "Done. Log out and back in for shell + docker group changes to take effect."
