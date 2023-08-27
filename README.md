# dotfiles

repository containing my config files.

this is not a fancy stuff just my stuff used mostly.

this dotfiles used [Chezmoi](https://www.chezmoi.io/) as it's manager.

Since I use [EndeavourOS](https://endeavouros.com/) with KDE I can say that "I use Arch, btw".

pretty sure it will work with any Arch-based install, not sure about Manjaro though since they holding back Pacman iirc.

I also use Parrot sometimes so I made versions for debian.

## Table of Contents

- [dotfiles](#dotfiles)
  - [Table of Contents](#table-of-contents)
  - [Installation For My Arch](#installation-for-my-arch)
  - [Install Kali/Parrot (kinda done, not sure)](#install-kaliparrot-kinda-done-not-sure)
  - [Adding New Dotfiles](#adding-new-dotfiles)
  - [Editing](#editing)
  - [To-Add List](#to-add-list)

## Installation For My Arch

to use this dotfile, simply copy this to terminal and run

```sh
curl -fsSL https://raw.githubusercontent.com/dhupee/dotfiles/master/dot_scripts/kickstart-full.sh | bash
```

or, if you just need the essential stuff

```sh
curl -fsSL https://raw.githubusercontent.com/dhupee/dotfiles/master/dot_scripts/kickstart.sh | bash
```

check the file to see what you will download, or fork it and you used it for your own need

## Install Kali/Parrot (kinda done, not sure)

I use parrot ~~Kali~~ okay, and not all tools I need is there, so

```sh
curl -fsSL https://raw.githubusercontent.com/dhupee/dotfiles/master/dot_scripts/install-kali.sh | bash
```

## Adding New Dotfiles

if you want to add new dotfile, do this in terminal.

```sh
chezmoi add <dotfile directory>
```

or you can add your file/folder directory in the `dot_scripts/chezmoi-save.sh` to automate it.

## Editing

since i use VScode as my text editor/IDE so what I do to edit the dotfiles easily is like this, first open terminal.

```sh
chezmoi cd
code .
```

then you can code like usual then commit it to the repo and then on terminal apply the change.

```sh
cd $HOME
chezmoi -v apply
```

## To-Add List

- [x] making KDE backup and restore (will use Konsave), `not automated since the size is humongous`
- [x] automate my Bottles setting update ~~(Use python for creating file name with regex, iirc bash dont have regex)~~ manage to made one in bash script
- [ ] saving osu's songs/skins/data and other big files to google drive/dropbox(need to find the cli)
- [ ] making one-liner scripts for micro only, incase i need SSH works
