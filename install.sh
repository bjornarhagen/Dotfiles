#!/bin/bash

system=""
echo "What system do you want to install for?"
select wml in "Linux" "MacOS" "Windows"; do
    case $wml in
    Linux)
        system="Linux"
        break
        ;;
    MacOS)
        system="MacOS"
        break
        ;;
    Windows)
        system="Windows"
        break
        ;;
    esac
done

# dotfiles_location=$HOME/.dotfiles
# read -p "Where are your .dotfiles located? (ie. /home/user/.dotfiles): " dotfiles_location

echo "Where are your .dotfiles located? (ie. /home/user/.dotfiles):?"
select wml in "~/.dotfiles" "~/dotfiles" "~/Dotfiles" "other, custom"; do
    case $wml in
    "~/.dotfiles")
        dotfiles_location="$HOME/.dotfiles"
        break
        ;;
    "~/dotfiles")
        dotfiles_location="$HOME/dotfiles"
        break
        ;;
    "~/Dotfiles")
        dotfiles_location="$HOME/Dotfiles"
        break
        ;;
    "other, custom")
        read -p "Enter the path to your .dotfiles: " dotfiles_location
        break
        ;;
    esac
done

install_file_location=$dotfiles_location/scripts/dotfiles/"$system"-install.sh
echo "Starting installing for $system with $install_file_location ..."
bash $install_file_location $dotfiles_location
