# not only aliases but also functions
# if i think its going to be more cumbersome i'll split it
# TODO: organize the aliases alphabetically

# Clear
alias c="clear"

# FZF
alias f="fzf"

# Helix
alias hx="helix"
hxf() {
  helix $(fzf)	
}

# Plasma
alias plasma-restart="kquitapp5 plasmashell ; sleep 2s ; kstart5 plasmashell"

# Git
alias ga="git add"
alias gcm="git commit -m"
alias gpsh="git push"

# Goenv
alias goenv-update="cd ~/.goenv && git fetch --all && git pull"

# Bluetooth
alias bt-start="systemctl start bluetooth"
alias bt-stop="systemctl stop bluetooth"

# Qemu/KVM
alias vm-start="systemctl start libvirtd"
alias vm-stop="systemctl stop libvirtd"

# SSH Server
alias ssh-server-start="systemctl start sshd.service"
alias ssh-server-stop="systemctl stop sshd.service"
alias ssh-server-check="nc -v -z 127.0.0.1 22"

# Firewal
alias firewall-start="systemctl start firewalld.service"
alias firewall-stop="systemctl stop firewalld.service"

# LS & LL
alias ls="ls --color='auto'"
alias lsa="ls -a --color='auto'"
alias lla="ll -a"

# NVIM
alias v="vim"
alias nv="nvim"

# Dotfile save
alias dotsave="sh $HOME/.scripts/dotsave.sh"

# Symlink
alias symlink="ln -s"

# Run osu with dedicated graphics by default
# if [[ -d "$HOME/.var/app/sh.ppy.osu" ]]; then
#   alias osu="DRI_PRIME=1 flatpak run sh.ppy.osu"
# fi
alias osu="DRI_PRIME=1 /usr/bin/osu-lazer"


# Flatpak aliases, tidy up
if [[ -d "$HOME/.var/app/com.usebottles.bottles" ]]; then
  alias bottles-cli="flatpak run --command=bottles-cli com.usebottles.bottles"
fi

# Podman is Docker, fight me
# alias docker="podman"

# Arch-based maintenance
alias orphanrm="bash $HOME/.scripts/remove-orphans.sh"
alias orphanrm-aur="yay -Yc"
alias cacherm="rm -rf ~/.cache/*"

# Tunneling url/localhost
alias tunnel="cloudflared tunnel --url $1"

# copy gitignore to create a similar dockerignore
alias git2dock-ignore="cp $PWD/.gitignore $PWD/.dockerignore"

# backup bottles yml
alias bottles-backup="bash .scripts/bottles-backup.sh"

# nbfc fan control
alias fan-speed-full="sudo nbfc set --speed=100"
alias fan-speed-auto="sudo nbfc set --auto"

# FNM
alias fnm-update="curl -fsSL https://fnm.vercel.app/install | zsh -s -- --skip-shell"
