# not only aliases but also functions
# if i think its going to be more cumbersome i'll split it
# TODO: organize the aliases alphabetically

# Clear
alias c="clear"

# FZF
alias f="fzf"

# FFMPEG
alias ffconv="ffmpeg -i"
# Function to convert to 720p (16:9)
ff720p16:9() {
    ffmpeg -i "$1" -vf "scale=1280:720,setsar=1:1" -c:a copy -aspect 16:9 "$2"
}

# Function to convert to 480p (16:9)
ff480p16:9() {
    ffmpeg -i "$1" -vf "scale=854:480,setsar=1:1" -c:a copy -aspect 16:9 "$2"
}

# Function to convert to 360p (16:9)
ff360p16:9() {
    ffmpeg -i "$1" -vf "scale=640:360,setsar=1:1" -c:a copy -aspect 16:9 "$2"
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

# WARP 1.1.1.1
alias warp-service-start="systemctl start warp-svc.service"
alias warp-service-stop="systemctl stop warp-svc.service"
alias warp-init="warp-cli register ; sleep 1s ; warp-cli set-mode warp+doh"
alias warp-check="curl https://www.cloudflare.com/cdn-cgi/trace/"
alias warp-connect="warp-cli connect"
alias warp-disconnect="warp-cli disconnect"

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

# Install all Blackarch tools
alias blackarch-install-all="sudo pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u"

# Tunneling url/localhost
alias tunnel="cloudflared tunnel --url $1"

# copy gitignore to create a similar dockerignore
alias git2dock-ignore="cp $PWD/.gitignore $PWD/.dockerignore"

# backup bottles yml
alias bottles-backup="bash .scripts/bottles-backup.sh"

# nbfc fan control
alias fan-speed-full="sudo nbfc set --speed=100"
alias fan-speed-auto="sudo nbfc set --auto"

# For distroboxes
## Kali
alias kali-install-large="sudo apt update && sudo apt -y install kali-linux-large"
alias kali-install-headless="sudo apt update && sudo apt -y install kali-linux-headless"
## Ubuntu
alias ubuntu-install-essential="sudo apt update && sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git"

# FNM
alias fnm-update="curl -fsSL https://fnm.vercel.app/install | zsh -s -- --skip-shell"
