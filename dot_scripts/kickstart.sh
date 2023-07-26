#!/bin/bash

# Install Chezmoi using pacman
sudo pacman -S --noconfirm chezmoi

# Clone your dotfiles repository using Chezmoi
chezmoi init --source https://github.com/dhupee/dotfiles.git
chezmoi update

# install the needed programs
curl -fsSL https://raw.githubusercontent.com/dhupee/dotfiles/master/dot_scripts/install-arch.sh | sh

# apply the dotfiles
chezmoi -v apply