# my mostly used software
# WARNING: ONLY USE THIS SCRIPT FOR FEDORA

# set the directory to home
cd $HOME

# install git
sudo dnf install git-all

# install python 3.9
sudo dnf install python3.9

# install zsh and ohmyzsh
sudo dnf install zsh
chsh -s $(which zsh)
sh -c \ 
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install ohmyzsh plugins
git clone https://github.com/zdharma/fast-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# install brave-browser
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

# install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c \ 
    'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install code

# enable RPM fusion
sudo dnf install \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release

# install flatpak then enable flathub remote
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install spotify and discord
sudo flatpak install flathub com.spotify.Client com.discordapp.Discord

#-----------------------------INSTALL RPM FILES------------------------
# also dont forget to update it
cd Downloads/

# download WPS office
wget https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11664/wps-office-11.1.0.11664.XA-1.x86_64.rpm
sudo rpm -i wps-office-11.1.0.11664.XA-1.x86_64.rpm

# go back to home and print done
cd $HOME
echo "Installation Done! Please restart to enable changes on the zsh"
