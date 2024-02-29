# FZF
alias f="fzf"

# Live-grepping history with fzf
function historygrep() {
    eval $(history -n | fzf +s --tac | sed 's/ *[0-9]* *//')
}
