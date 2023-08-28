# clear
alias c="clear"

# fuzzy search
alias f="fzf"

# plasma restart
alias plasma-restart="kquitapp5 plasmashell ; sleep 2s ; kstart5 plasmashell"

# start bluetooth
alias bt-start="systemctl start bluetooth"
alias bt-stop="systemctl stop bluetooth"

# start qemu/kvm services
alias vm-start="systemctl start libvirtd"
alias vm-stop="systemctl stop libvirtd"

# start ssh server services
alias ssh-server-start="systemctl start sshd.service"
alias ssh-server-stop="systemctl stop sshd.service"
alias ssh-server-check="nc -v -z 127.0.0.1 22"

# start warp-cli services
alias warp-service-start="systemctl start warp-svc.service"
alias warp-service-stop="systemctl stop warp-svc.service"

# ls
alias ls="ls -a --color='auto'"

# nvim
alias vim="nvim"
alias nv="nvim"

# save my dotfiles
alias dotsave="bash $HOME/.scripts/chezmoi-save.sh"

# symlink
alias symlink="ln -s"

# run osu with dedicated graphics by default
if [[ -d "$HOME/.var/app/sh.ppy.osu" ]]; then
  alias osu="DRI_PRIME=1 flatpak run sh.ppy.osu"
fi

# flatpak aliases, tidy up
if [[ -d "$HOME/.var/app/com.usebottles.bottles" ]]; then
  alias bottles-cli="flatpak run --command=bottles-cli com.usebottles.bottles"
fi

# Podman is Docker, fight me
alias docker="podman"

# Arch-based maintenance
alias orphanrm="bash $HOME/.scripts/remove-orphans.sh"
alias orphanrm-aur="yay -Yc"
alias cacherm="rm -rf ~/.cache/*"

# Install all Blackarch tools
alias blackarch-install-all="sudo pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u"

# tunneling url/localhost
alias tunnel="cloudflared tunnel --url $1"

# copy gitignore to create a similar dockerignore
alias git2dock-ignore="cp $PWD/.gitignore $PWD/.gitignore"

# backup bottles yml
alias bottles-backup="bash .scripts/bottles-backup.sh"


