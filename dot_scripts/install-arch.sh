#!/bin/bash

# LIST OF ESSENTIAL PROGRAMS TO INSTALL FROM PACMAN
# Note: this one is CLI only, make sure of that
essential_pacman_programs=(
    zsh
    fzf
    chezmoi
    git-lfs
    htop
    thefuck
    micro
    github-cli
    neofetch
    podman
	cloudflared
	tldr
	tmux
)

# LIST OF MISC PROGRAMS TO INSTALL FROM PACMAN
misc_pacman_programs=(
	libreoffice
    discord
    cmatrix
    steam
    prusa-slicer
    virt-manager
    qemu
    lutris
    kicad
	inkscape
    yt-dlp
	obs-studio
)

# LIST OF ESSENTIAL PROGRAMS TO INSTALL FROM AUR USING YAY
essential_aur_programs=(
    spotify
    visual-studio-code-bin
    brave-bin
    arduino-ide-bin
)

# LIST OF MISC PROGRAMS TO INSTALL FROM AUR USING YAY
misc_aur_programs=(
    bottles
    osu-lazer-bin
    heroic-games-launcher-bin
)

# List of custom Ohmyzsh plugins
custom_ohmyzsh_plugins=(
    "https://github.com/zsh-users/zsh-syntax-highlighting.git"
    "https://github.com/zsh-users/zsh-autosuggestions.git"
    "https://github.com/marlonrichert/zsh-autocomplete.git"
)

# FUNCTION TO INSTALL PROGRAMS FROM PACMAN AND AUR
install_programs_pacman() {
    # INSTALL THE PROGRAMS FROM PACMAN
    sudo pacman -S --noconfirm "$@"
    if [ $? -ne 0 ]; then
        echo "Failed to install some programs from pacman. Skipping."
    fi
}

install_programs_aur() {
    # INSTALL THE PROGRAMS FROM AUR USING YAY
    yay -S --needed --noconfirm "$@"
    if [ $? -ne 0 ]; then
        echo "Failed to install some programs from AUR. Skipping."
    fi
}

# CHECK IF YAY (AUR HELPER) IS INSTALLED, IF NOT, INSTALL IT
if ! command -v yay &>/dev/null; then
    echo "Installing yay..."
    if ! sudo pacman -S --needed --noconfirm git base-devel; then
        echo "Failed to install prerequisites for yay. Skipping."
    fi

    # CLONE YAY REPOSITORY FROM AUR AND INSTALL WITHOUT SUDO
    tmp_dir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmp_dir"
    (cd "$tmp_dir" && makepkg -si --noconfirm)
    rm -rf "$tmp_dir"
fi
wait

# UPDATE PACKAGE DATABASE
echo "Updating package database..."
if ! sudo pacman -Sy; then
    echo "Failed to update package database. Skipping."
fi
wait

# CHECK IF --all FLAGS IS PROVIDED
install_full_programs=false
if [[ "$1" == "--full" ]]; then
    install_full_programs=true
    shift
fi
wait

# INSTALL PACMAN PROGRAMS
install_programs_pacman "${essential_pacman_programs[@]}"
if $install_full_programs; then
    install_programs_pacman "${misc_pacman_programs[@]}"
fi
wait

# INSTALL AUR PROGRAMS WITH YAY
install_programs_aur "${essential_aur_programs[@]}"
if $install_full_programs; then
    install_programs_aur "${misc_aur_programs[@]}"
fi
wait

# INSTALL OHMYZSH
echo "Installing Ohmyzsh..."
if sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
    echo "Ohmyzsh installed successfully."
else
    echo "Failed to install Ohmyzsh. Skipping."
fi
wait

# Install custom Ohmyzsh plugins using a for loop
for plugin in "${custom_ohmyzsh_plugins[@]}"; do
    echo "Cloning plugin: ${plugin}"
    if git clone --depth 1 "$plugin" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$(basename "$plugin" .git)"; then
        echo "Plugin cloned successfully."
    else
        echo "Failed to clone plugin: ${plugin}"
    fi
done
wait

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
wait

# INSTALL GOBREW
echo "Installing Gobrew..."
if curl -sLk https://raw.githubusercontent.com/kevincobain2000/gobrew/master/git.io.sh | sh; then
    echo "Gobrew installed successfully."
else
    echo "Failed to install Gobrew. Skipping."
fi
wait

# INSTALL NVM
echo "Installing nvm..."
if curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash; then
    echo "nvm installed successfully."
else
    echo "Failed to install nvm. Skipping."
fi
wait

# INSTALL PYENV
echo "Installing pyenv..."
if curl https://pyenv.run | bash; then
    echo "pyenv installed successfully."
else
    echo "Failed to install pyenv. Skipping."
fi
wait

# TODO: Make report, if its failed or not
echo "All programs have been installed successfully!"

# CHANGE THE DEFAULT SHELL TO ZSH
echo "Change default shell to zsh..."
sudo chsh -s "$(which zsh)"
