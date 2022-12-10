#!bin/bash

# need ARG setting for restore
# ? maybe just use python instead eh??

# backup gnome-shell
dconf dump /org/gnome/shell/ > .gnome-backup/gnome-shell

# backup gnome-desktop
dconf dump /org/gnome/desktop/ > .gnome-backup/gnome-desktop

# backup settings-daemon
dconf dump /org/gnome/settings-daemon/ > .gnome-backups/settings-daemon

# backup freedesktop (for now it's just for anthy)
dconf dump /org/freedesktop/ > .gnome-backups/freedesktop
