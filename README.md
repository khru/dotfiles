# Parts

## Root folder
All the dotfiles

## .software folder
Install all the software I need

*Command:*:`make init`

# Git bare documentation
https://martijnvos.dev/using-a-bare-git-repository-to-store-linux-dotfiles/

# Config repo

```bash
# Create the directory for your bare repository
1. mkdir ~/.dotfiles

# Initialize a bare repository in the directory you just created
2. git init --bare ~/.dotfiles

# Create a Git alias that references the Git dotfiles repository and the local root directory from which Git adds files by default
3. alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Configure the dotfiles bare repository to hide untracked files
4. dotfiles config status.showUntrackedFiles no

# Add the remote location to the repository (in this case GitHub) 
5. dotfiles remote add origin https://github.com/khru/dotfiles.git

```

# Importing dotfiles

https://medium.com/@lucaskay/install-node-and-npm-using-nvm-in-mac-or-linux-ubuntu-f0c85153e173
Install git
```
sudo apt-get install -y git
```

Install make
```
sudo apt-get install build-essential
```

```bash
git clone https://github.com/khru/dotfiles.git ~/.dotfiles
```

# How to pull
```bash
git pull --rebase --autostash
```

# Set keybindings
```
rofi -show drun -show-icons
```

# NVM optimitation
https://tommckenzie.dev/posts/reduce-shell-startup-time-by-lazy-loading-nvm.html
