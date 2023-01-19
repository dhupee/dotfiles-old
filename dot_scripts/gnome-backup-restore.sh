#!/bin/bash

if [ "$1" == "backup" ]; then
    # backup gnome settings
    dconf dump /org/gnome/ > .gnome_backups/gnome_dconf
    echo "Gnome settings successfully backed up to .gnome_backups/gnome_dconf"
elif [ "$1" == "restore" ]; then
    # restore gnome settings
    dconf load /org/gnome/ < .gnome_backups/gnome_dconf
    echo "Gnome settings successfully restored from .gnome_backups/gnome_dconf"
else
    echo "Invalid argument. Use backup or restore."
fi
