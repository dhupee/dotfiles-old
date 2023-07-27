#!/bin/bash

# List of programs to install from pacman
pacman_programs=(
    # Add your desired programs from pacman here
    # Example: "firefox"
    # Example: "code"
    # Example: "git"
    git
    git-lfs
    zsh
    htop
    cmatrix
    steam
)

# List of programs to install from AUR using yay
aur_programs=(
    # Add your desired programs from AUR here
    # Example: "visual-studio-code-bin"
    # Example: "spotify"
    heroic-games-launcher-bin
    osu-lazer-bin
    spotify
)

# Function to install programs from pacman and AUR
install_programs() {
    for program in "$@"; do
        if ! pacman -Qi "$program" &>/dev/null; then
            echo "Installing $program..."
            if ! sudo pacman -S --noconfirm "$program"; then
                echo "Failed to install $program from pacman. Aborting."
                exit 1
            fi
        else
            echo "$program is already installed from pacman. Skipping."
        fi
    done
}

# Install yay (AUR helper) if not already installed
if ! command -v yay &>/dev/null; then
    echo "Installing yay..."
    if ! sudo pacman -S --needed --noconfirm git base-devel; then
        echo "Failed to install prerequisites for yay. Aborting."
        exit 1
    fi

    # Clone yay repository from AUR and install without sudo
    tmp_dir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmp_dir"
    (cd "$tmp_dir" && makepkg -si --noconfirm)
    rm -rf "$tmp_dir"
fi

# Update package database
echo "Updating package database..."
if ! sudo pacman -Sy; then
    echo "Failed to update package database. Aborting."
    exit 1
fi

# Install the programs from pacman
install_programs "${pacman_programs[@]}"

# Install the programs from AUR using yay without sudo
if [[ ${#aur_programs[@]} -gt 0 ]]; then
    echo "Installing AUR programs using yay..."
    if ! yay -S --needed --noconfirm "${aur_programs[@]}"; then
        echo "Failed to install AUR programs using yay. Aborting."
        exit 1
    fi
fi

# Install Ohmyzsh
echo "Installing Ohmyzsh..."
chsh -s $(which zsh)
if sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
    echo "Ohmyzsh installed successfully."
else
    echo "Failed to install Ohmyzsh. Aborting."
    exit 1
fi

# Install Gobrew
echo "Installing Gobrew..."
if curl -sLk https://raw.githubusercontent.com/kevincobain2000/gobrew/master/git.io.sh | sh; then
    echo "Gobrew installed successfully."
else
    echo "Failed to install Gobrew. Aborting."
    exit 1
fi

# Install Ohmyzsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# Install Ohmyzsh themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Install nvm
echo "Installing nvm..."
if curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash; then
    echo "nvm installed successfully."
else
    echo "Failed to install nvm. Aborting."
    exit 1
fi

# Install pyenv
echo "Installing pyenv..."
if curl https://pyenv.run | bash; then
    echo "pyenv installed successfully."
else
    echo "Failed to install pyenv. Aborting."
    exit 1
fi

echo "All programs have been installed successfully!"
