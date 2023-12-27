#!/usr/bin/bash

CONFIG_FILES="$HOME/.config/waybar/waybar.conf $HOME/.config/waybar/style.css"

trap "/usr/bin/killall waybar" EXIT

while true; do
    waybar -c $HOME/.config/waybar/waybar.conf -s $HOME/.config/waybar/style.css &
    inotifywait -e create,modify $CONFIG_FILES
    /usr/bin/killall waybar
    sleep 0.2
done