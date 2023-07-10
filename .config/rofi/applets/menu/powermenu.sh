#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/powermenucopy.rasi"

uptime=$(uptime -p | sed -e 's/up //g')
cpu=$($HOME/.config/rofi/bin/usedcpu)
memory=$($HOME/.config/rofi/bin/usedram)

# Options
shutdown=""
reboot=""
# lock=""
suspend=""
logout=""
terminal=""
files=""
editor=""
browser=""
music=""
#settings=""


# Confirmation
confirm_exit() {
	rofi -dmenu\
	-i\
		-no-fixed-num-lines\
		-p "Are You Sure? : "\
		-theme $HOME/.config/rofi/applets/styles/confirm.rasi
}

# Message
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
#options="$terminal $shutdown $files $reboot $editor $suspend $browser $logout $music"
options="$terminal\n$shutdown\n$files\n$reboot\n$editor\n$suspend\n$browser\n$logout\n$music"


# n$lock\
chosen="$(echo -e  "$options" | $rofi_command   -p "祥  $uptime  |     $cpu  |  ﬙  $memory "  -dmenu -selected-row 0  )"  



case $chosen in
    ($shutdown)
       systemctl poweroff		
#           ans=$(confirm_exit &)
#		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
#			systemctl poweroff
#		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
#			exit 0
#        else
#			msg
#        fi
        ;;
    ($reboot)
      systemctl reboot
#		ans=$(confirm_exit &)
#		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
#			systemctl reboot
#		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
#			exit 0
 #       else
#			msg
#        fi
        ;;
    ($lock)
#		if [[ -f /usr/bin/i3lock ]]; then
			i3lock
#		elif [[ -f /usr/bin/betterlockscreen ]]; then
#			betterlockscreen -l
#		fi
        ;;
    ($suspend)
#		ans=$(confirm_exit &)
#		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y"]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
#		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
#			exit 0
 #       else
#			msg
 #       fi
        ;;
    ($logout)
#		ans=$(confirm_exit &)
#		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ||]]; then
#			if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
				openbox --exit
#			elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
#				bspc quit
#			elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
#				i3-msg exit
#			fi
#		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
#			exit 0
#       else
#			msg
#        fi
        ;;
            ($terminal)
#		if [[ -f /usr/bin/konsole ]]; then
			konsole 
#		if [[ -f /usr/bin/termite ]]; then
#			termite &
#		elif [[ -f /usr/bin/kitty ]]; then
#			kitty &
#		else
#			msg "No suitable terminal found!"
#		fi
        ;;
    ($files)
#		if [[ -f /usr/bin/nautilus ]]; then
			nautilus 
#		else
#			msg "No suitable file manager found!"
#		fi
        ;;
    ($editor)
#		if [[ -f /usr/bin/gedit ]]; then
			code 			
#		else
#			msg "No suitable text editor found!"
#		fi
        ;;
    ($browser)
#			if [[ -f /usr/bin/brave-beta ]]; then
			brave-beta 
#		else
#			msg "No suitable web browser found!"
#		fi
        ;;
    ($music)
#		if [[ -f /usr/bin/konsole ]]; then
			 konsole -e cmus 
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
