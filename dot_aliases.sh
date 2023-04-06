# clear
alias c="clear"

# ls
alias ls="ls -a --color='auto'"

# nvim
alias vim="nvim"

# save my dotfiles
alias dotsave="sh .scripts/chezmoi-save.sh"

# upgrade all stuff in dnf and flatpak
alias upgrade-all="sudo dnf upgrade && flatpak update"

# cloudflare cli
alias cloudflared="$HOME/.bin/cloudflared-linux-amd64"

# symlink
alias symlink="ln -s"

# install and uninstall from dnf
alias inst-pac="sudo pacman -S"
alias uninst-pac="sudo pacman -S"

# run osu with dedicated graphics by default
alias osu="DRI_PRIME=1 flatpak run sh.ppy.osu"

# Podman is Docker, fight me
alias docker=podman

# Remove orphan packages
alias orphanrm="sh .scripts/remove-orphans.sh"
