export EDITOR="vim"
export PS1="🔮 \[\e[33m\]\w\[\e[m\] 🔮 "
export CLICOLOR=1

eval "$(hub alias -s)"
eval "$(direnv hook bash)"
eval "$(fnm env --multi)"

export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="./node_modules/.bin:$PATH"

alias vim="nvim"
alias vi="nvim"
