# dotfiles

Repository containing my config files, scripts, and bunch of stuffs. Not fancy by any means it's just stuffs I used mostly.

This dotfiles used [Chezmoi](https://www.chezmoi.io/) as it's manager.

Since I use [EndeavourOS](https://endeavouros.com/) with KDE I can say that "I use Arch, btw". Pretty sure it will work with any Arch-based install, not sure about Manjaro though since they holding back Pacman iirc.

I also use Parrot sometimes so I made versions for debian, but I plan to deprecate it since I decided to use distrobox instead of VMs

## WARNING

This Dotfiles is for me and I only make this for me, so if you want to used it or maybe fork it be careful, it might auto-update everyday, it might have a different script next day, it might break.

I don't take any consideration for someone's idea because this dotfile is for me, but if you want to fork for learning purpose, then have fun.

IF YOU REALLY WANT TO TRY THIS, please read the code first to see how the scripts work, this awful documentation is either for show-off or simply to give me reminder because I'll know what I'm doing.

## Table of Contents

- [dotfiles](#dotfiles)
  - [WARNING](#warning)
  - [Table of Contents](#table-of-contents)
  - [Features, sort of](#features-sort-of)
  - [Gallery of my Rice](#gallery-of-my-rice)
  - [Install stuffs](#install-stuffs)
    - [Installation For My Arch](#installation-for-my-arch)
    - [Install Kali/Parrot (kinda done, not sure)](#install-kaliparrot-kinda-done-not-sure)
    - [Adding Helix Configs Only](#adding-helix-configs-only)
    - [Adding Tmux Configs Only](#adding-tmux-configs-only)
  - [Managing My/Your Dotfiles](#managing-myyour-dotfiles)
    - [Adding New Dotfiles](#adding-new-dotfiles)
    - [Editing](#editing)
  - [To-Add List](#to-add-list)

## Features, sort of

TBA

## Gallery of my Rice

![Wallpaper 1](img/dh-nordic-dark-bmw/4%20-%20jsURB6I.png)

![Wallpaper 2](img/dh-nordic-dark-bmw/5%20-%20oTbWYwb.png)

![Wallpaper 1](img/dh-nordic-dark-bmw/2%20-%201FItUUI.png)

## Install stuffs

NOTE: I plan to deprecate the script in favour of unified method with ansible, I'm still learning it but just heads up for you who fork this, and for future me.

### Installation For My Arch

to use this dotfile, simply copy this to terminal and run

```sh
curl -fsSL https://raw.githubusercontent.com/dhupee/dotfiles/master/dot_scripts/kickstart-full.sh | bash
```

or, if you just need the essential stuff

```sh
curl -fsSL https://raw.githubusercontent.com/dhupee/dotfiles/master/dot_scripts/kickstart.sh | bash
```

check the file to see what you will download, or fork it and you used it for your own need

### Install Kali/Parrot (kinda done, not sure)

I use parrot ~~Kali~~ okay, and not all tools I need is there, so

NOTE: I plan to deprecate this or just simply delete since I might use distrobox in the future for my kali linux usage

```sh
curl -fsSL https://raw.githubusercontent.com/dhupee/dotfiles/master/dot_scripts/install-kali.sh | bash
```

### Adding Helix Configs Only

If you need Helix config of mine(why?) you can import it with this, assuming you have Helix installed already.

Helix is better than Neovim at this because it only has one file, perfect for cloud instances.

```sh
mkdir -p $HOME/.config/helix && curl https://raw.githubusercontent.com/dhupee/dotfiles/master/private_dot_config/helix/config.toml > $HOME.config/helix/config.toml
```

### Adding Tmux Configs Only

Same goes for Tmux, Tmux somehow pre-installed in every vast.ai instance so I'm forced to used this, the config of mine used TPM as plugin manager, and maybe I will add few additions or mix.

```sh
curl https://raw.githubusercontent.com/dhupee/dotfiles/master/dot_tmux.conf > $HOME/.tmux.conf
```

## Managing My/Your Dotfiles

### Adding New Dotfiles

if you want to add new dotfile, do this in terminal.

```sh
chezmoi add <dotfile directory>
```

or you can add your file/folder directory in the `dot_scripts/dotsave.sh` to automate it.

### Editing

since i use ~~VScode~~ Neovim as my text editor/IDE so what I do to edit the dotfiles easily is like this, first open terminal.

```sh
chezmoi cd
nvim .
```

then you can code like usual then commit it to the repo and then on terminal apply the change.

```sh
cd $HOME
chezmoi -v apply
```

## To-Add List

Finished feature will be listed in [Features](#features-sort-of) section

- [x] making KDE backup and restore (will use Konsave), `not automated since the size is humongous`, EDIT: I use rclone to do it and manage to used it for backup osu beatmap aswell, and smaller sensitive file like ssh
- [x] automate my Bottles setting update ~~(Use python for creating file name with regex, iirc bash dont have regex)~~ manage to made one in bash script
- [x] saving osu's songs/skins/data and other big files to google drive/dropbox(need to find the cli)
- [ ] make a script to backup my files from mega to my home dir, with making the dir, and file size checking to just to make sure
- [x] make a script for backup my torrents, yes I pirate movies(just save the .config to mega lol)
- [x] split my aliases into smaller chunks
- [ ] modified the bootstrap/installer scripts to check if the listed app installed or not, and add uninstaller method
- [ ] Split the distro agnostic functions from the installer scripts.
