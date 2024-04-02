#!/usr/bin/env zsh
set -x

brightness() {
	brightnessctl --device='tpacpi::kbd_backlight' $@
}

if [ "$#" -eq 0 ]; then
	OUTPUT=$(brightness "get")
	if [[ "$OUTPUT" == "0" ]]; then
		brightness "set" "100%"
	else
		brightness "set" "0%"
	fi
	exit 0
fi

brightness "set" "$@"
