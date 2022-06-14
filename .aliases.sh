#alias zsh="source $HOME/.zshrc" 
alias lsl="ls -lhFA | less"
alias fhere="find . -name "
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias myip="curl http://ipecho.net/plain; echo"
alias lip="hostname -I | xargs -n 1 | fzf"
alias sudo="sudo -E " # preserve environment by default
alias htop="TERM=screen htop"
alias random='uuidgen -r | md5sum |  sed "s/ .*$//"'
alias uuid="uuidgen -r"
alias uuidc="uuid | pbcopy"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias ..="cd .."
alias ...="cd ../.."
alias du="du -ach | sort -h"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias fhere="find . -name"
alias fd="fdfind"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias purge-node-modules="find . -name node_modules -type d -prune -exec rm -rf {} +"
alias du="du -ach | sort -h"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias fhere="find . -name"
alias tzsh="repeat 10 {time zsh -i -c exit}"
alias c="pbcopy"
alias up="upgrade_oh_my_zsh && npm update && zimfw update && zimfw upgrade && sudo apt-get update && sudo apt-get upgrade -y"
alias lg='lazygit'

# PHP
alias pf="./vendor/bin/phpunit --filter"
alias behat="./vendor/bin/behat"
alias bf="./vendor/bin/behat -p"
alias cr="composer require --ignore-platform-reqs"

# Docker
alias dps="docker-compose ps"
alias dstart="docker-compose up -d lb"
alias drmv="docker-compose kill && docker-compose rm -f"
alias dreset="docker-compose kill && docker-compose rm -f && dstart"

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
alias k="kubectl"
alias kns="kubens"
alias kctx="kubectx"

# Dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Node
alias tb="taskbook"
alias tbl="taskbook --timeline"
alias tbt="taskbook --task"
alias tbn="taskbook --note"
alias tbd="taskbook --delete"

# Youtube-dl
alias dyp='youtube-dl -ci -f best -o "%(playlist_index)s-%(title)s.%(ext)s"'
alias dy="youtube-dl -x -f best "
alias dt='youtube-dl --external-downloader aria2c --external-downloader-args "-x 16"'

# Systems
alias getip='dig @resolver4.opendns.com myip.opendns.com +short -4'
alias python=python3


# Codely
alias gcl="clone_git_repo"

# VPN Wiregard
alias vpn_up="sudo wg-quick up wg0"
alias vpn_down="sudo wg-quick down wg0"


# New commands
alias ls="exa"
alias bat="batcat"
#alias cat="bat --paging=never"
