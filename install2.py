import os

os.system("cargo install wallust")

def append_to_bashrc(lines):
    bashrc_path = os.path.join(os.getenv("HOME"), ".bashrc")
    
    with open(bashrc_path, "a") as bashrc:
        for line in lines:
            bashrc.write(line + "\n")
    print(f"Lines appended to {bashrc_path}")

lines_to_append = [
    "PS1='\\[\\033[01;31m\\]❰ INT \\[\\033[01;36m\\]⌥ /\\w\\[\\033[01;31m\\] ❱\\[\\033[01m\\] \\[\\033[0m\\] '",
    "wallust run ~/.config/dotfiles/images/wallpaper.jpg -q -n",
    "alias fixcolors='wallust run ~/.config/dotfiles/images/wallpaper.jpg -q -n'"
]

append_to_bashrc(lines_to_append)

print("Installation done..")
print("\nNote: I added no error handling to this because i dont care about you as an end-user, if it fucks up.. just DM me at \'integersarebad\' on discord.")