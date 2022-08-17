# saving my gnome setting then send them to chezmoi

cd $HOME
dconf dump / > .gnome-settings.ini

# assumed you already have chezmoi installed
chezmoi add .gnome-settings.ini
