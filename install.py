import os
import shutil

warning = input("note: part of this config is for bash, not zsh or fish or anything else.. so this will append some commands to .bashrc\nPress enter to continue.. ")
warning2 = input("another note: this will install the necessary dependencies, Ctrl-C NOW if you dont want to install anything..\nPress enter to continue.. ")



os.system("sudo pacman -S feh kitty rofi polybar neofetch picom")
os.system("curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh")


def replace_config(source, destination):
    if not os.path.exists(source):
        print(f"Source not found: {source}")
        return

    if os.path.exists(destination):
        backup_destination = destination + ".backup"
        if os.path.exists(backup_destination):
            print(f"Backup already exists. Removing old backup: {backup_destination}")
            if os.path.isdir(backup_destination):
                shutil.rmtree(backup_destination)
            else:
                os.remove(backup_destination)
        print(f"Backing up {destination} to {backup_destination}")
        os.rename(destination, backup_destination)

    shutil.move(source, destination)
    print(f"Moved {source} to {destination}")

home = os.getenv("HOME")
configurations = [
    ("./i3/config", f"{home}/.config/i3/config"),
    ("./polybar", f"{home}/.config/polybar"),
    ("./neofetch", f"{home}/.config/neofetch"),
    ("./rofi", f"{home}/.config/rofi"),
]

for source, destination in configurations:
    replace_config(source, destination)

print("Remember to configure the i3 config and remove/configure the xrandr command for your display setup.")
print("Please restart your terminal and then run install2.py, this adds some finishing touches..")

