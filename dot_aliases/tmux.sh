# pick either "tmux" or "tmate""
TARGET="tmux"

# Sessions
alias tsa="$TARGET attach -t"
alias tsd="$TARGET detach -t"
alias tsk="$TARGET kill-session -t"
alias tsn="$TARGET new-session -t"
alias tsl="$TARGET list-sessions"
alias tsr="$TARGET rename-session"

# Windows
alias twl="$TARGET list-windows"
alias twk="$TARGET kill-window"
alias twr="$TARGET rename-window"

# Panes
alias tpk="$TARGET kill-pane"

# Sourcing
alias tsrc="$TARGET source ~/.$TARGET.conf"
