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
if [ "$(sysctl -n sysctl.proc_translated)" = "1" ]; then
  local brew_path="/usr/local/bin"
else
  # m1
  echo "m1!"
  local brew_path="/opt/homebrew/bin"
fi
export PATH="${brew_path}:${PATH}"

alias vim="nvim"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

export PATH="$HOME/.cargo/bin:$PATH"

# Enable reverse search in zshrc
bindkey -v
bindkey '^R' history-incremental-search-backward

