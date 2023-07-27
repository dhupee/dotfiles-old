#!/bin/bash

# List of essential programs to install from pacman
essential_pacman_programs=(
    git
    zsh
    chezmoi
    git-lfs
    htop
)

# List of misc programs to install from pacman
misc_pacman_programs=(
    cmatrix
    steam
)

# List of essential programs to install from AUR using yay
essential_aur_programs=(
    spotify
)

# List of misc programs to install from AUR using yay
misc_aur_programs=(
    osu-lazer-bin
    heroic-games-launcher-bin
)

# Function to install programs from pacman and AUR
install_programs_pacman() {
    # Install the programs from pacman
    sudo pacman -S --noconfirm "$@"
    if [ $? -ne 0 ]; then
        echo "Failed to install some programs from pacman. Skipping."
    fi
}

install_programs_aur() {
    # Install the programs from AUR using yay
    yay -S --needed --noconfirm "$@"
    if [ $? -ne 0 ]; then
        echo "Failed to install some programs from AUR. Skipping."
    fi
}

# Check if yay (AUR helper) is installed, if not, install it
if ! command -v yay &>/dev/null; then
    echo "Installing yay..."
    if ! sudo pacman -S --needed --noconfirm git base-devel; then
        echo "Failed to install prerequisites for yay. Skipping."
    fi

    # Clone yay repository from AUR and install without sudo
    tmp_dir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmp_dir"
    (cd "$tmp_dir" && makepkg -si --noconfirm)
    rm -rf "$tmp_dir"
fi
wait

# Update package database
echo "Updating package database..."
if ! sudo pacman -Sy; then
    echo "Failed to update package database. Skipping.
fi
wait

# Check if the --all flag is provided
install_full_programs=false
if [[ "$1" == "--full" ]]; then
    install_full_programs=true
    shift
fi
wait

# Install the programs from pacman
install_programs_pacman "${essential_pacman_programs[@]}"
if $install_full_programs; then
    install_programs_pacman "${misc_pacman_programs[@]}"
fi
wait

# Install the programs from AUR using yay
install_programs_aur "${essential_aur_programs[@]}"
if $install_full_programs; then
    install_programs_aur "${misc_aur_programs[@]}"
fi
wait

# Install Ohmyzsh
echo "Installing Ohmyzsh..."
if sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
    echo "Ohmyzsh installed successfully."
else
    echo "Failed to install Ohmyzsh. Skipping.
fi
wait

# Install Gobrew
echo "Installing Gobrew..."
if curl -sLk https://raw.githubusercontent.com/kevincobain2000/gobrew/master/git.io.sh | sh; then
    echo "Gobrew installed successfully."
else
    echo "Failed to install Gobrew. Skipping.
fi
wait

# Install Ohmyzsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
wait

# Install Ohmyzsh themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
wait

# Install nvm
echo "Installing nvm..."
if curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash; then
    echo "nvm installed successfully."
else
    echo "Failed to install nvm. Skipping."
fi
wait

# Install pyenv
echo "Installing pyenv..."
if curl https://pyenv.run | bash; then
    echo "pyenv installed successfully."
else
    echo "Failed to install pyenv. Skipping.
fi
wait

echo "All programs have been installed successfully!"

# change the shell to zsh
echo "Change default shell to zsh..."
sudo chsh -s "$(which zsh)"
