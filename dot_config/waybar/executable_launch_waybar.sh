#!/usr/bin/bash

CONF="$HOME/.config/waybar/waybar.conf"
CSS="$HOME/.config/waybar/style.css"
CONFIG_FILES="$CONF $CSS"

trap "/usr/bin/killall waybar" EXIT

while true; do
    waybar -c $CONF -s $CSS &
    inotifywait -e create,modify $CONFIG_FILES
    /usr/bin/killall -SIGUSR2 waybar
    sleep 0.2
done
