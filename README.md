# dotfiles

repository containing my config files.

this is not a fancy stuff just my stuff used mostly.
this dotfiles used [Chezmoi](https://www.chezmoi.io/) as it's manager.

Since I use [EndeavourOS](https://endeavouros.com/) with KDE I can say that "I use Arch, btw".

## Installation

to use this dotfile(to remind me if I somehow forgot), connect your github first with [SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) to make you dont have to login every commit.
then in terminal paste shell script below.

```sh
# I should repair this
cd $HOME
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.bin
chezmoi init git@github.com:dhupee/dotfiles.git
chezmoi cd
sudo bash dot_scripts/install.sh
chezmoi -v apply
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

- [ ] making ~~gnome~~ KDE backup and restore (need VM for this, dont want to ruin my config)
- [ ] automate my Bottles setting update (Use python for creating file name with regex, iirc bash dont have regex)
- [ ] saving osu's songs/skins/data and other big files to google drive/dropbox
- [ ] automation script for copy gitignore content to dockerignore
- [ ] script for init on live usb
- [ ] branch for parrot OS/BlackArch
