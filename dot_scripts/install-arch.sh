#!/bin/bash

# LIST OF ESSENTIAL PROGRAMS TO INSTALL FROM PACMAN

## Note:
# 'essential_pacman_programs' is CLI only, make sure of that.
# use flatpak for any sandbox software, like bottles


essential_pacman_programs=(
    btop
    chezmoi
    distrobox
    docker
    fzf
    gamemode
    github-cli
    git-lfs
    htop
    lib32-gamemode
    micro
    neofetch
    nvtop
    p7zip
    tldr
    thefuck
    zsh
)

# LIST OF MISC PROGRAMS TO INSTALL FROM PACMAN
misc_pacman_programs=(
    cmatrix
    discord
    fcitx5-configtool
    fcitx5-im
    fcitx5-mozc
    flatpak
    gparted
    inkscape
    kicad
    kio-gdrive
    latte-dock
    libreoffice
    lutris
    noto-fonts-emoji
    obs-studio
    prusa-slicer
    qemu-base
    steam
    ttf-jetbrains-mono-nerd
    virt-manager
    v4l2loopback-dkms
    yt-dlp
)

# LIST OF ESSENTIAL PROGRAMS TO INSTALL FROM AUR USING YAY
essential_aur_programs=(
    arduino-ide-bin
    brave-bin
    cloudflare-warp-bin
    kwin-polonium
    nbfc-linux
    ngrok
    spicetify-cli
    spotify
    visual-studio-code-bin
)

# LIST OF MISC PROGRAMS TO INSTALL FROM AUR USING YAY
misc_aur_programs=(
    bottles
    heroic-games-launcher-bin
    konsave
    osu-lazer-bin
)

flatpak_programs=(
    com.usebottles.bottles
)

# List of custom Ohmyzsh plugins
custom_ohmyzsh_plugins=(
    "https://github.com/zsh-users/zsh-syntax-highlighting.git"
    "https://github.com/zsh-users/zsh-autosuggestions.git"
    "https://github.com/marlonrichert/zsh-autocomplete.git"
    "https://github.com/zsh-users/zsh-history-substring-search"
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

# INSTALL SOFTWARE WITH FLATPAK
flatpak install -y flathub "${flatpak_programs}"
wait

# INSTALL OHMYZSH
echo "Installing Ohmyzsh..."
if sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --skip-chsh; then
    echo "Ohmyzsh installed successfully."
else
    echo "Failed to install Ohmyzsh. Skipping."
fi
wait

# INSTALL CUSTOM OHMYZSH PLUGINS USING A FOR LOOP
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

# INSTALL VOLTA
echo "Installing volta..."
if curl https://get.volta.sh | bash
    echo "volta installed successfully."
else
    echo "Failed to install volta. Skipping."
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

# CHANGE PERMISSION OF SPICETIFY, ACCORDING TO DOCS
if [ -d "/opt/spotify" ]; then
    sudo chmod a+wr /opt/spotify
    sudo chmod a+wr /opt/spotify/Apps -R
    echo "Permissions changed successfully."
else
    echo "Directory /opt/spotify does not exist."
fi
wait

echo "All programs have been installed successfully!"

# CHANGE THE DEFAULT SHELL TO ZSH
echo "Change default shell to zsh..."
sudo chsh -s bin/zsh
wait
