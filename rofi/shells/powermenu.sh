#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Lock" | rofi -dmenu -p "")

case "$chosen" in
	"  Power Off") systemctl poweroff;;
	"  Restart") reboot ;;
	"  Lock") i3lock ;;
	*) exit 1 ;;
esac
