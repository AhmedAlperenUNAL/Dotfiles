#!/bin/sh

rofi_command="rofi -theme ~/.config/rofi/powermenu/powermenu.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Variable Passed To Rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        betterlockscreen -l blur
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        i3-msg exit
        ;;
esac
