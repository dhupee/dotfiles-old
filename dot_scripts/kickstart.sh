#!/bin/bash

# install the needed programs
curl -fsSL https://raw.githubusercontent.com/dhupee/dotfiles/master/dot_scripts/install-arch.sh | sudo bash

# Clone your dotfiles repository using Chezmoi
chezmoi init --apply dhupee
