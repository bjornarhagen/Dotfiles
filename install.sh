#!/bin/bash

system=""
echo "What system do you want to install for?"
select wml in "Windows" "MacOS" "Linux"; do
    case $wml in
        Windows )
								system="Windows"
								break;;
				MacOS )
								system="MacOS"
								break;;
				Linux )
								system="Linux"
								break;;
				esac
done

echo "Starting installing for $system..."
bash ~/.dotfiles/scripts/dotfiles/"$system"-install.sh

