if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting ''

wallust run ~/.config/dotfiles/images/nyc.png -q -n --threshold 3

function fixcolors
    wallust run ~/.config/dotfiles/images/nyc.png -q -n --threshold 1
end

function fetch
    neofetch --ascii ~/.config/neofetch/ascii
end
