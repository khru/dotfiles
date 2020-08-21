#!/bin/bash

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# powerlevel10
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

curl -fsSL https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh -o ~/.zim/zimfw.zsh
sudo chmod +x ~/.zim/zimfw.zsh
zsh ~/.zim/zimfw.zsh install

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

sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install -y numix-gtk-theme
sudo apt-get install -y numix-icon-theme numix-folders
sudo apt-get install -y numix-icon-theme-circle
sudo apt-get install -y numix-icon-theme-square

# Nerd fonts
sudo add-apt-repository ppa:font-manager/staging
sudo apt-get update
sudo apt-get install -y font-manager

[ -d "~/nerd-fonts" ] && git clone https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
sudo chmod +x ~/nerd-fonts/install.sh
echo "✔️ Instaling Nerd Fonts"
~/nerd-fonts/install.sh
echo "🗑️ Erasing Nerd Fonts"
sudo rm -rf ~/nerd-fonts