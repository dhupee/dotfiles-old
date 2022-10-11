#!/usr/bin/env bash

# need ARG setting for restore
# need functions for other conf too(dnf.conf)

cd $HOME

#--------------------BACKUP CONF-------------------------------------

# backup gnome-shell
dconf dump /org/gnome/shell/ > $HOME/.gnome-backups/gnome-shell
# backup gnome-desktop
dconf dump /org/gnome/desktop/ > $HOME/.gnome-backups/gnome-desktop
# backup settings-daemon
dconf dump /org/gnome/settings-daemon/ > $HOME/.gnome-backups/settings-daemon
# backup freedesktop (for now it's just for anthy)
dconf dump /org/freedesktop/ > $HOME/.gnome-backups/freedesktop
