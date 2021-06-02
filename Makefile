SHELL=/bin/bash

# include .env
#export $(shell sed 's/=.*//' .env)

help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  init                    Run ALL"
	@echo "  dotfiles                Creates a symbolic link with the dotfiles"
	@echo "  software                Install all the software"

init: dotfiles software

dotfiles:
	@sudo chmod +x ./main.sh
	./main.sh
	sudo apt-get install -y zsh
	zsh -i -c gitconfig && exit

software:
	@sudo chmod +x ./.software
	./.software/init.sh
