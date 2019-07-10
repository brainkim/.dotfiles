export EDITOR="vim"
export PS1="🔮 \[\e[33m\]\w\[\e[m\] 🔮 "
export CLICOLOR=1

eval "$(hub alias -s)"
eval "$(direnv hook bash)"

# VOLTA
export VOLTA_HOME="$HOME/.volta"
[ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"

export PATH=/usr/local/sbin:$PATH
export PATH=./node_modules/.bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=/Users/brian/Library/Python/2.7/bin:$PATH
export PATH="$VOLTA_HOME/bin:$PATH"
