#!/bin/bash

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# ZSH npm plugin
git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion

# Icons and themes
git clone https://github.com/erikdubois/Ultimate-Linux-Mint-19-Cinnamon ~/cinnamon-19
sudo chmod +x -R ~/cinnamon-19
~/cinnamon-19/theme-arc-colora-collection-3.4-v1.sh
~/cinnamon-19/theme-arc-colora-collection-3.6-v1.sh
~/cinnamon-19/theme-mint-y-colora-collection-3.6-v1.sh
~/cinnamon-19/install-gtk-arc-theme-v1.sh
~/cinnamon-19/install-arc-flatabulous-theme-v1.sh
~/cinnamon-19/icons-sardi-v3.sh
~/cinnamon-19/icons-surfn-v4.sh


# Nerd fonts
sudo add-apt-repository ppa:font-manager/staging
sudo apt-get update
sudo apt-get install font-manager

git clone https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
sudo chmod +x ~/nerd-fonts/install.sh
~/nerd-fonts/install.sh
sudo rm -rf nerd-fonts