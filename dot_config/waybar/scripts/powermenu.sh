#!/usr/bin/env bash

DIR="~/.config/rofi"
uptime=$(uptime |awk '{print $3}' | rev | cut -c2- | rev)
rofi_command="rofi -show window -no-config -no-lazy-grab -theme $DIR/launcher.rasi"
#OPtions
shutdown="⏻ shutdown"
reboot=" reboot"
screenlock=" screenlock"
suspend="󰤄 sleep"
logout=" logout"

options="$screenlock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"
if test -z "$chosen"
then
    echo "No option chosen!"
else
    case $chosen in
        $shutdown)
            systemctl poweroff
        ;;
        $reboot)
            systemctl reboot
        ;;
        $screenlock)
            xlock
        ;;
        $lock)
            swaylock -c "303133"
        ;;
        $suspend)
            systemctl suspend
        ;;
        $logout)
            hyprctl dispatch exit
        ;;
    esac
fi
