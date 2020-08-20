SHELL=/bin/bash

# include .env
#export $(shell sed 's/=.*//' .env)

help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  init                    Run the main script"

TIMESTAMP=$(shell date "+%Y%m%d-%H%M%S");
init:
	sudo chmod +x ./.software
	sudo chmod +x ./main.sh
	./main.sh
	./.software/init.sh