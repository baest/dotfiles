#!/usr/bin/zsh

if /usr/bin/checkupdates --nocolor >/tmp/pkg_updates.txt; then
  notify-send 'PKG updates available' "$(cat /tmp/pkg_updates.txt)"
fi
