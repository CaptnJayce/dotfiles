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
    # Terminal
    tmux

    # Editor
    neovim

    # CLI tools
    yazi
    lazygit
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
    supabase-bin       # CLI you use in portfolio/quran projects
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
    ~/.config/fastfetch

ln -sf "$DOTFILES/hypr/hyprland.conf"     ~/.config/hypr/hyprland.conf
ln -sf "$DOTFILES/hypr/hyprpaper.conf"    ~/.config/hypr/hyprpaper.conf
ln -sf "$DOTFILES/hypr/hyprlauncher.conf" ~/.config/hypr/hyprlauncher.conf
ln -sf "$DOTFILES/hypr/hyprtoolkit.conf"  ~/.config/hypr/hyprtoolkit.conf
ln -sf "$DOTFILES/kitty/kitty.conf"       ~/.config/kitty/kitty.conf
ln -sf "$DOTFILES/kitty/miko.conf"        ~/.config/kitty/miko.conf
ln -sf "$DOTFILES/mako/config"            ~/.config/mako/config
ln -sf "$DOTFILES/waybar/config.jsonc"    ~/.config/waybar/config.jsonc
ln -sf "$DOTFILES/waybar/style.css"       ~/.config/waybar/style.css
ln -sf "$DOTFILES/fish/config.fish"       ~/.config/fish/config.fish
ln -sf "$DOTFILES/fastfetch/config.jsonc" ~/.config/fastfetch/config.jsonc
ln -sf "$DOTFILES/assets/pfp/miko.jpg"   ~/.face

# nvim — symlink the whole directory
if [ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then
    info "~/.config/nvim already exists as a real directory — skipping (move or delete it manually)"
else
    ln -sfn "$DOTFILES/nvim" ~/.config/nvim
fi

# ── salah-bar ─────────────────────────────────────────────────────────────────
section "Installing salah-bar"
if [ ! -d ~/.local/share/salah-bar ]; then
    git clone https://github.com/CaptnJayce/salah-bar ~/.local/share/salah-bar
    chmod +x ~/.local/share/salah-bar/salah_bar.py
else
    info "salah-bar already installed — skipping"
fi

# ── done ──────────────────────────────────────────────────────────────────────
echo
echo "Done. Log out and back in for shell + docker group changes to take effect."
