TMUX_CONF_URL="https://raw.githubusercontent.com/dhupee/dotfiles/master/dot_tmux.conf"

git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl $TMUX_CONF_URL > ~/.tmux.conf
