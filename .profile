export EDITOR="vim"
export PS1="\[\e[1;33m\]🌚 speak child 🌝 \\w \[\e[0m\]🌞 "
export CLICOLOR=1
export PYTHONDONTWRITEBYTECODE=True

eval "$(hub alias -s)"

export NVM_DIR="/Users/brian/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm use v6.11.1 --silent
export PATH=./node_modules/.bin:$PATH

TERM=xterm; export TERM
