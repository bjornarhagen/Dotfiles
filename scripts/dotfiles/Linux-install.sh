#!/bin/bash

echo "Starting linux install."

function install () {
				printf "\n\n\n"
				eval "sudo $package_manager $package_manager_install_flag $1"
				printf "\n\n\nDone! $1 was installed. \n\n"
}

distro=""
package_manager=""
printf "\nWhat distribution of Linux are you running?\n"
select d in "Ubuntu" "Debian" "Other"
do
				case $d in
								Ubuntu )
												distro="Ubuntu"
												package_manager="apt-get"
												package_manager_install_flag="install"
												break;;
								Debian )
												distro="Debian"
												package_manager="apt-get"
												package_manager_install_flag="install"
												break;;
								Other )
												distro="Other"
												echo "Other distributions of Linux are not offically supported, but may work just fine"
												read -p "What's your distribution? (ie. Arch Linux / Monjaro)" distro
												read -p "What's your package manager? (ie. Pacman)" package_manager
												read -p "What's the flag for installing with $package_manager?" package_manager_install_flag
												echo "Trying to continue..."
												break;;
				esac
done

# Setup symlinks in home dir to .dotfiles
function stow_load {
	cd $HOME/.dotfiles
	stow -vt $1 $2
}

printf "\nSettings up links\n"
mkdir -p ~/scripts
stow_load ~/scripts scripts
stow_load ~ common
stow_load ~ cron
stow_load ~ oh-my-zsh
stow_load ~ bash
stow_load ~ vim
stow_load ~ x
printf "Done!"


# Install composer
php_installed=$(which php)
composer_installed=$(which composer)
printf "\n\nDo you wish to install composer (for PHP)?\n"
select yn in "Yes" "No"
do
    case $yn in
        Yes )
								if [ -z "$php_installed" ]
								then
												printf "\n\nCould not find PHP, do you want to install it now?\n"
												select php_yn in "Yes" "No"
												do
																case $php_yn in
																				Yes )
																								install "php-fpm"
																								break;;
																				No)
																								break;;
																esac
												done
								fi

								if [ -z "$composer_installed" ]
								then
												printf "\n\nStarting composer install...\n"

												composer_install_dir=""
												read -p "Where would you like to install composer? Default is in ~/bin: " composer_install_dir

												if [ -z "$composer_install_dir" ]
												then
																composer_install_dir="$HOME/bin"
												fi

												EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
												php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
												ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

												if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
												then
												    >&2 echo 'ERROR: Invalid installer signature'
												    rm composer-setup.php
												    exit 1
												fi

												php composer-setup.php --install-dir="$composer_install_dir"
												rm composer-setup.php

												# Composer shortcut
												echo "#!/bin/bash" >> $HOME/bin/composer
												echo "php $HOME/bin/composer.phar" >> $HOME/bin/composer
												chmod 755 "$HOME/bin/composer"

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
