export EDITOR="nvim"
export PROMPT="%~ %# "
export CLICOLOR=1

#eval "$(direnv hook bash)"

export PATH="$PATH:./node_modules/.bin"
#export PATH="$PATH:/usr/local/sbin"
#export PATH="$PATH:~/.cargo/bin"
#export PATH="$PATH:~/.deno/bin"

alias vim="nvim"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# Enable reverse search in zshrc
bindkey -v
bindkey '^R' history-incremental-search-backward
