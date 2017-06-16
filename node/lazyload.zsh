load_nvm() {
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

nvm() {
    unset -f nvm
    load_nvm
    nvm "$@"
}
 
node() {
    unset -f node
    load_nvm
    node "$@"
}
 
npm() {
    unset -f npm
    load_nvm
    npm "$@"
}
