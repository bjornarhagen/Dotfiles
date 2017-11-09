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

# Install composer
composer_installed=$(which composer | grep 'not found')
echo "Do you wish to install this composer?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
								if [ "$composer_installed" == "not found" ]
								then
												echo "Starting composer install..."
												php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
												php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
												php composer-setup.php --install-dir=bin
												php -r "unlink('composer-setup.php');"
												echo "Composer is now installed"
								else
												echo "Composer is already installed"
								fi
								break;;
        No )
								echo "Composer will not be installed."
								exit;;
    esac
done
