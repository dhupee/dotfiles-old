# clear
alias c="clear"

# fuzzy search
alias f="fzf"

# start bluetooth
alias bt-start="systemctl start bluetooth"

# start qemu/kvm virtual machines
alias vm-start="systemctl start libvirtd"

# ls
alias ls="ls -a --color='auto'"

# nvim
alias vim="nvim"

# save my dotfiles
alias dotsave="bash $HOME/.scripts/chezmoi-save.sh"

# cloudflare cli
# alias cloudflared="$HOME/.bin/cloudflared-linux-amd64"

# symlink
alias symlink="ln -s"

# run osu with dedicated graphics by default
alias osu="DRI_PRIME=1 flatpak run sh.ppy.osu"

# Podman is Docker, fight me
alias docker="podman"

# Remove orphan packages
alias orphanrm="bash $HOME/.scripts/remove-orphans.sh"

# Install all Blackarch tools
alias blackarch-install-all="sudo pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u"

# tunneling url/localhost
alias tunnel="cloudflared tunnel --url $1"
