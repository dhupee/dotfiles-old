# dotfiles

repository containing my config files.

this is not a fancy stuff just my stuff used mostly.
this dotfiles used [chezmoi](https://www.chezmoi.io/) as their manager

I use [Fedora](https://getfedora.org) with Gnome DE, btw

## Installation

to use this dotfile(to remind me if I somehow forgot), connect your github first with [SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) to make you dont have to login every commit
then in terminal paste shell script below

```sh
cd $HOME
sh -c "$(curl -fsLS https://chezmoi.io/get)"
chezmoi init git@github.com:dhupee/dotfiles.git
chezmoi cd
sudo bash dot_scripts/install.sh
chezmoi -v apply
```

## Adding New Dotfiles

if you want to add new dotfile, do this in terminal

```sh
chezmoi add <dotfile directory>
```

## Editing

since i use VScode as my text editor/IDE so what I do to edit the dotfiles easily is like this, first open terminal

```sh
chezmoi cd
code .
```

then you can code like usual then commit it to the repo and then on terminal apply the change

```sh
cd $HOME
chezmoi -v apply
```

## To-Add List

- [ ] making gnome backup and restore(need VM for this, dont want to ruin my tweaks)
- [ ] automate my Bottles setting update
- [X] adding few files from .config/ folder, such as htop hehe (but also automated it)
