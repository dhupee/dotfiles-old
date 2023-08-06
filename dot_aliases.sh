# clear
alias c="clear"

# fuzzy search
alias f="fzf"

# start bluetooth
alias bt-start="systemctl start bluetooth"

# start qemu/kvm services
alias vm-start="systemctl start libvirtd"
alias vm-stop="systemctl stop libvirtd"

# start warp-cli services
alias warp-service-start="systemctl start warp-svc.service"
alias warp-service-stop="systemctl stop warp-svc.service"

# ls
alias ls="ls -a --color='auto'"

# nvim
alias vim="nvim"

# save my dotfiles
alias dotsave="bash $HOME/.scripts/chezmoi-save.sh"

# symlink
alias symlink="ln -s"

# run osu with dedicated graphics by default
alias osu="DRI_PRIME=1 flatpak run sh.ppy.osu"

# Podman is Docker, fight me
alias docker="podman"

# Remove orphan packages
alias orphanrm="bash $HOME/.scripts/remove-orphans.sh"
alias orphanrm-aur="yay -Yc"

# Install all Blackarch tools
alias blackarch-install-all="sudo pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u"

# tunneling url/localhost
alias tunnel="cloudflared tunnel --url $1"
