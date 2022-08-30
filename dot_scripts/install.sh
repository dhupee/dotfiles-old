# my mostly used software
# WARNING: ONLY USE THIS SCRIPT FOR FEDORA

# set the directory to home
cd $HOME

# install stuff from dnf
sudo dnf install git-all\
                python3.9\
                gnome-tweaks\
                htop\
		cmatrix\
                zsh

# install github cli
sudo dnf config-manager \
    --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh

# install ohmyzsh
chsh -s $(which zsh)
sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install ohmyzsh plugins
git clone https://github.com/zdharma/fast-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# install ohmyzsh themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

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


#-----------------------------INSTALL FLATPAK------------------------

# install flatpak then enable flathub remote
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install spotify and discord
sudo flatpak install flathub \
    com.spotify.Client \
    com.discordapp.Discord \
    com.usebottles.bottles

#-----------------------------INSTALL APPIMAGES------------------------

# make directory $HOME/Appimages
sudo mkdir -p $HOME/Appimages
cd $HOME/Appimages

# download superslicer
wget https://github.com/supermerill/SuperSlicer/releases/download/2.4.58.4/SuperSlicer-ubuntu_18.04-2.4.58.4.AppImage
chmod a+x SuperSlicer-ubuntu_18.04-2.4.58.4.AppImage

#-----------------------------INSTALL RPM FILES------------------------
# also dont forget to update it
cd $HOME/Downloads/

# download WPS office
wget https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11664/wps-office-11.1.0.11664.XA-1.x86_64.rpm

# install any rpm file I've downloaded
sudo rpm -i *.rpm

#-----------------------------INSTALL FEW GIT REPOS--------------------
if [ ! -d $HOME/Tools ]; then
    echo "No directory, making it"
    mkdir $HOME/Tools
else
    echo "Directory already exist"
fi
cd $HOME/Tools

# clone superslicer config
git clone https://github.com/dhupee/Ender3V2_SuperSlicer_Config

# go back to home and print done
cd $HOME
echo "Installation Done! Please restart to enable changes on the zsh"
