#!/bin/bash

# Requesting sudo upfront
echo "Please enter your password for sudo access."
sudo -v

# Copying folders to ~/.config/ and replacing existing ones
echo "Copying configuration folders to ~/.config/..."
cp -rf ./neofetch ./fish ./i3 ./kitty ./polybar ./rofi ~/.config/

# System update and installations
echo "Updating system and installing packages..."
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
sudo pacman -S --noconfirm pulseaudio ffmpeg keepass nvidia nodejs npm piper ntfs-3g discord feh kitty fish rofi polybar neofetch picom flameshot ttf-dejavu ttf-liberation nerd-fonts noto-fonts adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts
yay -S --noconfirm ttf-font-awesome
fc-cache -f -v
sudo npm i -g pnpm
sudo pacman -S --noconfirm pavucontrol-qt
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Handling the need for a new terminal for cargo install
echo "Installing wallust..."
(sleep 2; echo "cargo install wallust") | i3-sensible-terminal

# Changing the default shell to fish
echo "Setting default shell to fish..."
chsh -s $(which fish)

# Final message to the user
echo "Please configure the xrandr config located at ~/.config/i3/config otherwise your display may be messed up."
echo "Please install the appropriate graphics drivers for your system, as this script is configured for modern NVIDIA graphics cards."

echo "Script execution completed."
