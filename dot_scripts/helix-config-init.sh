DOTFILE_URL="https://github.com/dhupee/dotfiles"

if [ -d "/tmp/dotfiles/" ]; then
echo "dotfiles exist"
else
	echo "downloading dotfiles"
	git clone --depth=1 $DOTFILE_URL /tmp/dotfiles/ 
fi	
cd /tmp/dotfiles/
cp -r /tmp/dotfiles/private_dot_config/helix ~/.config/helix
echo "success initialized tmux configuration"
