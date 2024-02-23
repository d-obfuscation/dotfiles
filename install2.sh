#!/bin/bash

# Install the Rust package
cargo install wallust

# Define the function to append lines to .bashrc
append_to_bashrc() {
    bashrc_path="$HOME/.bashrc"
    
    for line in "$@"; do
        echo "$line" >> "$bashrc_path"
    done
    echo "Lines appended to $bashrc_path"
}

# Lines to be appended
lines_to_append=(
    "PS1='\\[\\033[01;31m\\]❰ DST \\[\\033[01;36m\\]⌥ /\\w\\[\\033[01;31m\\] ❱\\[\\033[01m\\] \\[\\033[0m\\] '"
    "wallust run ~/.config/dotfiles/images/wallpaper.jpg -q -n"
    "alias fixcolors='wallust run ~/.config/dotfiles/images/wallpaper.jpg -q -n'"
)

# Append the lines to .bashrc
append_to_bashrc "${lines_to_append[@]}"

echo "Installation done.."
echo "\nNote: I added no error handling to this because i dont care about you as an end-user, if it fucks up.. just DM me at 'integersarebad' on discord."
