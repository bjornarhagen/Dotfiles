#!/bin/bash

read -p "What system do you want to install for? (linux/os-x/windows) " system

bash ~/.dotfiles/scripts/dotfiles/"$system"-install.sh

