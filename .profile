export EDITOR="vim"
export PS1="\[\e[1;33m\]🌚 speak child 🌝 \\w \[\e[0m\]🌞 "
export CLICOLOR=1

export PYTHONDONTWRITEBYTECODE=True

export NVM_DIR="/Users/brian/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm use v8.11.1 --silent

export PATH=./node_modules/.bin:$PATH
export PATH=/Users/brian/Library/Python/2.7/bin:$PATH
export PATH=/usr/local/sbin:$PATH

eval "$(hub alias -s)"
eval "$(direnv hook bash)"
