# dotfiles

repository containing my config files.

this is not a fancy stuff just my stuff used mostly.
this dotfiles used [chezmoi](https://www.chezmoi.io/) as their manager

## Installation

to use this dotfile(to remind me if I somehow forgot)

```sh
sh -c "$(curl -fsLS https://chezmoi.io/get)"
chezmoi init --apply https://github.com/dhupee/dotfiles.git # stop here if you dont want to install stuff
cd $HOME/.scripts/
sudo bash install.sh 
```
