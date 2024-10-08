#!/bin/sh
# !!! IMPORTANT !!!
# I run a minimal EnOS installation with hyprland on top, it is PERSONALISED for me. I do not recommend running this script unless you are me
# I am not liable for any problems or conflicts this may cause in your system 

# pacman packages
pacman -S vulkan-radeon lib32-vulkan-radeon networkmanager wofi stow kitty flatpak curl yay hyprland hyprpaper neovim steam discord git gcc raylib yazi fastfetch lua nodejs npm sddm ttf-jetbrains-mono-nerd ttf-hack-nerd 

# unintall
pacman -R amdvlk lib32-amdvlk

# packages that can't be installed via pacman 
# if it fails just copy paste command manually
yay -S jetbrains-toolbox spotify hyprshot waybar-git --noconfirm

# flatpaks
flatpak install flathub com.ultimaker.cura

# oh my posh install
mkdir ~/.local/bin
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin
