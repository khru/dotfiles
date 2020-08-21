alias lsl="ls -lhFA | less"
alias fhere="find . -name "
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias myip="curl http://ipecho.net/plain; echo"
alias lip"hostname -I | xargs -n 1 | fzf"
alias sudo="sudo -E " # preserve environment by default
alias htop="TERM=screen htop"
alias random="uuidgen -r | md5sum |  sed 's/ .*$//'"
alias uuid="uuidgen -r"
alias uuidc="uuid | pbcopy"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias ..="cd .."
alias ...="cd ../.."
alias du="du -ach | sort -h"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias fhere="find . -name" 
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias purge-node-modules="find . -name node_modules -type d -prune -exec rm -rf {} +"
alias du="du -ach | sort -h"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias fhere="find . -name"
alias tzsh"repeat 10 {time zsh -i -c exit}"
alias c='pbcopy'
alias up='upgrade_oh_my_zsh && npm update && zimfw update && zimfw upgrade && sudo apt-get update && sudo apt-get upgrade -y'

# Docker
alias dps='docker-compose ps'
alias dstart='docker-compose up -d lb'
alias drmv='docker-compose kill && docker-compose rm -f'
alias dreset='docker-compose kill && docker-compose rm -f && dstart'

# Git
alias git="LANGUAGE=C LC_ALL=es_ES.utf-8 git"
alias got="git "
alias gp="git pull --rebase"
alias gps="git push"
alias gs="git status"
alias gd="git diff"
alias grc="git rebase --continue"
alias grs="git rebase --skip"
alias gra="git rebase --abort"
alias ga="git commit --amend"

#kubernetes
alias k=kubectl
alias kns=kubens
alias kctx=kubectx

# Dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Networking
alias lsip=nmcli -g ip4.address device show $(ifconfig | cut -d ' ' -f1| tr ':' '\n' | awk NF | fzf)