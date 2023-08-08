#!bin/bash

# should work for any debian based as well

deb_programs=(
    zsh
    htop
    tldr
    fzf
)

# Install the programs
echo "Installing programs..."
if apt install -y "${deb_programs[@]}"; then
    echo "Programs installed successfully."
else
    echo "Failed to install programs. Skipping."
fi

# List of custom Ohmyzsh plugins
custom_ohmyzsh_plugins=(
    "https://github.com/zsh-users/zsh-syntax-highlighting.git"
    "https://github.com/zsh-users/zsh-autosuggestions.git"
    "https://github.com/marlonrichert/zsh-autocomplete.git"
    "https://github.com/zsh-users/zsh-history-substring-search"
)

# INSTALL OHMYZSH
echo "Installing Ohmyzsh..."
if sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
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

# CHANGE THE DEFAULT SHELL TO ZSH
echo "Change default shell to zsh..."
sudo chsh -s "$(which zsh)"
wait

# Clone your dotfiles repository using Chezmoi
chezmoi init --apply dhupee