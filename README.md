# Parts

## Root folder
All the dotfiles

## .software folder
Install all the software I need

*Command:*:`make init`



## Software
https://snapcraft.io/emote
https://github.com/tom-james-watson/emote

# From git
https://github.com/Mayccoll/Gogh.git
https://github.com/junegunn/fzf.git
https://github.com/ryanoasis/nerd-fonts.git
https://github.com/erikdubois/Ultimate-Linux-Mint-19-Cinnamon.git
https://github.com/ohmyzsh/ohmyzsh.git
https://github.com/romkatv/powerlevel10k

# From repos
## Other tools
sudo apt-get update -y
sudo apt-get install -y tilix
sudo apt-get install -y zsh
chsh -s $(which zsh)
sudo apt-get install -y git-core
sudo apt-get install -y git
sudo apt-get install -y htop
sudo apt-get install -y tree
sudo apt-get install -y uuid-runtime
sudo apt install -y xclip xsel
sudo apt install -y rofi

## ZSH
https://github.com/ohmyzsh/ohmyzsh
```
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)
```


# Rofi
use: `rofi -show drun -show-icons`

Find hidden config files
```bash
find . -maxdepth 1 -type f -name ".*"

ls -a
```

Find open files on software runnning

```bash
#!/usr/bin/env bash

selected=$(ps axc | awk 'NR > 1' | awk '{print substr($0,index($0,$5))}' | sort -u | fzf)

if [ ! -z $1 ]; then
  lsof -r 2 -c "$selected"
else
  lsof -c "$selected"
fi
```
```bash
sudo apt-get install build-essential
```