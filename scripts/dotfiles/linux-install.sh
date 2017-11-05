#!/bin/bash

echo "Starting linux install."
printf "["

function stow_load {
	cd ~/.dotfiles

	stow -vt $1 $2 & PID=$!

	while kill -0 $PID 2> /dev/null; do
		printf "."
		sleep 0.25
	done
}

mkdir ~/scripts
stow_load ~/scripts scripts
stow_load ~ common
stow_load ~ cron
stow_load ~ oh-my-zsh
stow_load ~ bash
stow_load ~ vim
stow_load ~ x

printf "]\nDone!\n\n"
