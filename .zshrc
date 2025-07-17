export EDITOR="nvim"
export PROMPT="%F{green}%~%f %F{13}%#%f "

export CLICOLOR=1

bindkey -e
setopt share_history

[ -f "$HOME/.env" ] && source "$HOME/.env"

alias vim="nvim"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="$PATH:~/.bun/bin"
export PATH="~/go/bin:$PATH"

export RUSTUP_HOME=/opt/rust
export CARGO_HOME=/opt/rust
export PATH="~/.cargo/bin:$PATH"

# llvm for bun development
export PATH="/opt/homebrew/opt/llvm@19/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm@19/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@19/include"

# bun completions
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"
export PATH="/Users/briankim/.bun/bin:$PATH"
