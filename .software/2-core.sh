#!/bin/bash

sudo apt-get install -y copyq
sudo apt-get install -y tilix
sudo apt-get install -y zsh
sudo apt-get install -y git-core
sudo apt-get install -y git
sudo apt-get install -y htop
sudo apt-get install -y tree
sudo apt-get install -y uuid-runtime
sudo apt-get install -y xclip xsel
sudo apt-get install -y rofi
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)
sudo apt-get install -y curl
sudo apt-get install -y jq
sudo apt-get install -y rsync grsync
sudo apt-get install -y python-pip
sudo apt-get install -y python3-pip
sudo apt-get install -y default-jre
sudo apt-get install -y openjdk-11-jdk openjdk-11-jre
sudo pip3 install pipenv
sudo apt-get install -y guake
sudo apt-get install -y tig
sudo apt-get install -y software-properties-common apt-transport-https wget ca-certificates gnupg-agent
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt-get install -y snapd
sudo apt-get install -y libnss3-tools
sudo apt-get install -y ffmpeg
sudo apt-get install -y libevent-dev ncurses-dev build-essential bison pkg-config
