# dotfiles

repository containing my config files.

this is not a fancy stuff just my stuff used mostly.
this dotfiles used [chezmoi](https://www.chezmoi.io/) as their manager

## Installation

to use this dotfile(to remind me if I somehow forgot)

```sh
cd $HOME
sh -c "$(curl -fsLS https://chezmoi.io/get)"
chezmoi init --apply https://github.com/dhupee/dotfiles.git # stop here if you dont want to install stuff
cd $HOME/.scripts/
sudo bash install.sh 
```

## Editing

since i use VScode as my editor what I do to edit the dotfiles easily is like this, first open terminal

```sh
chezmoi cd
code .
```

then you can code like usual then commit it to the repo and then on therminal apply the change

```sh
cd $HOME
chezmoi -v apply
```
