export EDITOR="vim"
# NOTE(brian): Make prompt have colors or something
export PS1="\[\e[1;33m\]🌚  speak child 🌝  \\w \[\e[0m\]🌞  "
# NOTE(brian): Make ls have colors or something
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

eval "$(hub alias -s)"

# NOTE(brian): NODE.JS NODE_JS? NOBE_JS node require
# NOTE(brian): web scale
# NOTE(brian): Start npm when terminal starts
export NVM_DIR="/Users/brian/.nvm"
. $(brew --prefix nvm)/nvm.sh
nvm use --silent 6.11.1

TERM=xterm; export TERM

export PATH="./node_modules/.bin:$PATH"  

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/brian/.google-cloud-sdk/path.bash.inc ]; then
  source '/Users/brian/.google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/brian/.google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/brian/.google-cloud-sdk/completion.bash.inc'
fi
