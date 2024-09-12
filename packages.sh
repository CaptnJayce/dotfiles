#!/bin/sh
# !!! IMPORTANT !!!
# I run a minimal EnOS installation with hyprland on top, it is PERSONALISED for me. I do not recommend running this script unless you are me
# I am not liable for any problems or conflicts this may cause in your system 


# pacman packages
pacman -S flatpak curl yay hyprland hyprpaper neovim discord qtcreator

# couldnt get spotify to install with pacman for some reason :/
yay -S spotify --noconfirm

# flatpaks
flatpak install flathub com.ultimaker.cura

# oh my posh install
mkdir ~/.local/bin
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin
