#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/apps.rasi"

# Links
terminal=""
files=""
editor=""
browser=""
music=""
#settings=""

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$terminal\n$files\n$editor\n$browser\n$music"
# \n$settings"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"

case $chosen in
    $terminal)
#		if [[ -f /usr/bin/konsole ]]; then
			konsole &
#		if [[ -f /usr/bin/termite ]]; then
#			termite &
#		elif [[ -f /usr/bin/kitty ]]; then
#			kitty &
#		else
#			msg "No suitable terminal found!"
#		fi
        ;;
    $files)
#		if [[ -f /usr/bin/nautilus ]]; then
			nautilus &
#		else
#			msg "No suitable file manager found!"
#		fi
        ;;
    $editor)
#		if [[ -f /usr/bin/gedit ]]; then
			code &			
#		else
#			msg "No suitable text editor found!"
#		fi
        ;;
    $browser)
#			if [[ -f /usr/bin/brave-beta ]]; then
			brave-beta &
#		else
#			msg "No suitable web browser found!"
#		fi
        ;;
    $music)
#		if [[ -f /usr/bin/konsole ]]; then
			 konsole -e cmus &
#			elif [[ -f /usr/bin/ ]]; then
#			 &
#		else
#			msg "No suitable music player found!"
#		fi
       ;;
#    $settings)
#		if [[ -f /usr/bin/xfce4-settings-manager ]]; then
#			xfce4-settings-manager &
#		else
#			msg "No suitable settings manager found!"
#		fi
#       ;;
esac
