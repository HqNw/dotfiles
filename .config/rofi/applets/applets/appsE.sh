#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/applets/style.sh)"

dir="$HOME/.config/rofi/applets/applets/configs/$style"
rofi_command="rofi -theme $dir/apps.rasi"

# Links
terminal=""
files=" "
editor=""
docker=""
music=""
python=""

# Error msg
msg() {
    rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$editor\n$docker\n$python\n$terminal\n$files\n$music"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
        if [[ -f /usr/bin/alacritty ]]; then
            hyprctl dispatch exec "[workspace special] alacritty --class alacritty -e sudo virt-viewer win10" &
            
        else
            msg "No suitable terminal found!"
        fi
        ;;
    $files)
        hyprctl dispatch exec "[workspace special] alacritty --class alacritty -e ~/Desktop/kvm.sh"
        ;;
    $editor)
        ~/.config/rofi/scripts/modes/program.sh
        ;;
    $docker)
	      ~/.config/rofi/scripts/modes/docker
        ;;
    $music)

        hyprctl dispatch exec "[workspace 5] spotify"

        ;;
    $python)
         hyprctl dispatch exec "[workspace special] alacritty --class alacritty -e jupyter notebook --ip=127.0.0.1 --port=8888"
        ;;
esac
