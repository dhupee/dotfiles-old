#!bin/bash

# backup gnome-shell
dconf dump /org/gnome/shell/ > .gnome-backup/gnome-shell
