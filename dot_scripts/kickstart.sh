#!/bin/bash

# Install Chezmoi using pacman
sudo pacman -S --noconfirm chezmoi

# Clone your dotfiles repository using Chezmoi
chezmoi init dhupee

# install the needed programs
curl -fsSL https://raw.githubusercontent.com/dhupee/dotfiles/master/dot_scripts/install-arch.sh | sudo bash

# apply the dotfiles
chezmoi -v apply