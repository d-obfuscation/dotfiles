#!/bin/bash

# Warning messages
read -p "note: part of this config is for bash, not zsh or fish or anything else.. so this will append some commands to .bashrc\nPress enter to continue.. "
read -p "another note: this will install the necessary dependencies, Ctrl-C NOW if you dont want to install anything..\nPress enter to continue.. "

# Install dependencies
sudo pacman -S feh kitty rofi polybar neofetch picom
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Function to replace configuration
replace_config() {
    source=$1
    destination=$2

    if [ ! -e "$source" ]; then
        echo "Source not found: $source"
        return
    fi

    if [ -e "$destination" ]; then
        backup_destination="${destination}.backup"
        if [ -e "$backup_destination" ]; then
            echo "Backup already exists. Removing old backup: $backup_destination"
            if [ -d "$backup_destination" ]; then
                rm -rf "$backup_destination"
            else
                rm -f "$backup_destination"
            fi
        fi
        echo "Backing up $destination to $backup_destination"
        mv "$destination" "$backup_destination"
    fi

    mv "$source" "$destination"
    echo "Moved $source to $destination"
}

# Main script
HOME=$(getent passwd $USER | cut -d: -f6)
declare -a configurations=(
    "./i3/config $HOME/.config/i3/config"
    "./polybar $HOME/.config/polybar"
    "./neofetch $HOME/.config/neofetch"
    "./rofi $HOME/.config/rofi"
)

for item in "${configurations[@]}"; do
    replace_config $item
done

echo "Remember to configure the i3 config and remove/configure the xrandr command for your display setup."
echo "Please restart your terminal and then run install2.sh, this adds some finishing touches.."
