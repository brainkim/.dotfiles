export EDITOR="nvim"
export PS1="%~ %% "
export CLICOLOR=1

#eval "$(direnv hook bash)"
eval "$(fnm env)"
fnm use 15 --log-level=error

export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:~/.cargo/bin"
export PATH="$PATH:~/.deno/bin"

alias vim="nvim"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

export PATH="$HOME/.cargo/bin:$PATH"
