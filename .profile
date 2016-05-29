# NOTE(brian): Make prompt have colors or something
export PS1="\[\e[1;33m\] \w 😈  \[\e[0m\]"

# NOTE(brian): Make ls have colors or something
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# NOTE(brian): NODE_JS web scale
# NOTE(brian): Start npm when terminal starts
# NOTE(briam): nvm is slow as shit
export NVM_DIR="/Users/brian/.nvm"
. $(brew --prefix nvm)/nvm.sh
nvm use --silent 5.8

TERM=xterm; export TERM

export PATH="./node_modules/.bin:$PATH"  
