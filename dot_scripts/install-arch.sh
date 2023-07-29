#!/bin/bash

# LIST OF ESSENTIAL PROGRAMS TO INSTALL FROM PACMAN
essential_pacman_programs=(
    zsh
    chezmoi
    git-lfs
    htop
    thefuck
    micro
    github-cli
    neofetch
    podman
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

# success and failure report array
succ_arr=()
fail_arr=()

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
        fail_arr+=("Failed to install some programs from Pacman.")
    else
    	succ_arr+=("Success install from Pacman." )
    fi
}

install_programs_aur() {
    # INSTALL THE PROGRAMS FROM AUR USING YAY
    yay -S --needed --noconfirm "$@"
    succ_arr+=("Success install from AUR." )
    if [ $? -ne 0 ]; then
        fail_arr+=("Failed to install some programs from AUR.")
    else
    	succ_arr+=("Success install from AUR." )
    fi
}

# CHECK IF YAY (AUR HELPER) IS INSTALLED, IF NOT, INSTALL IT
if ! command -v yay &>/dev/null; then
    echo "Installing yay..."
    if ! sudo pacman -S --needed --noconfirm git base-devel; then
        fail_arr+=("Failed to install prerequisites for yay.")
    else
    	succ_arr+=("Success to install prerequisites for yay." )
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
    fail_arr+=("Failed to update package database.)"
else
    succ_arr+=("Success to update package database." )
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
    succ_arr+=("Ohmyzsh installed successfully.")
else
    fail_arr+=("Failed to install Ohmyzsh.")
fi
wait

# Install custom Ohmyzsh plugins using a for loop
for plugin in "${custom_ohmyzsh_plugins[@]}"; do
    echo "Cloning plugin: ${plugin}"
    if git clone --depth 1 "$plugin" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$(basename "$plugin" .git)"; then
        succ_arr+=("Plugin cloned successfully.")
    else
        fail_arr+=("Failed to clone plugin: ${plugin}")
    fi
done
wait

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
wait

# INSTALL GOBREW
echo "Installing Gobrew..."
if curl -sLk https://raw.githubusercontent.com/kevincobain2000/gobrew/master/git.io.sh | sh; then
    succ_arr+=("Gobrew installed successfully.")
else
    fail_arr+=("Failed to install Gobrew.")
fi
wait

# IINSTALL NVM
echo "Installing nvm..."
if curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash; then
    succ_arr+=("nvm installed successfully.")
else
    fail_arr+=("Failed to install nvm.")
fi
wait

# INSTALL PYENV
echo "Installing pyenv..."
if curl https://pyenv.run | bash; then
    succ_arr+=("pyenv installed successfully.")
else
    fail_arr+=("Failed to install pyenv.")
fi
wait

# CHANGE THE DEFAULT SHELL TO ZSH
echo "Change default shell to zsh..."
sudo chsh -s "$(which zsh)"
wait

# Check if the array is empty
if [ ${#succ_arr[@]} -eq 0 ]; then
    echo " "
else
    # Iterate the loop to read and print each array element
    for value in "${succ_arr[@]}"
    do
         echo $value
    done
fi

# Check if the array is empty
if [ ${#fail_arr[@]} -eq 0 ]; then
    echo " "
else
    # Iterate the loop to read and print each array element
    for value in "${fail_arr[@]}"
    do
         echo $value
    done
fi
