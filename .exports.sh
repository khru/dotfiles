export PATH="$HOME/.symfony/bin:$PATH"
[ -f ~/.lazy-nvm.sh ] && source ~/.lazy-nvm.sh
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export GITHUB_TOKEN=""

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#mkdir -p ~/.idea/bin
#export PATH="$HOME/.idea/bin:$PATH"

export PATH="$HOME/.tfenv/bin:$PATH"
