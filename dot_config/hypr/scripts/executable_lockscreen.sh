swaylock --daemonize --color 000000
sleep '0.7s'
if ! ~/bin/is_at_office; then
    hyprctl dispatch dpms off
fi
