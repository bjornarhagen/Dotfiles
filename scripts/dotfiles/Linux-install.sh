#!/bin/bash

printf "\n🚀 Starting linux install."

# get dotfiles_location from first param
dotfiles_location=$1

function install() {
    printf "\n"
    command_to_run="sudo $package_manager $package_manager_install_flag $1"
    echo "Running: $command_to_run"
    eval $command_to_run
    printf "\nDone! $1 was installed. \n\n"
}

distro=""
package_manager=""
printf "\n🐧 What distribution of Linux are you running?\n"
select d in "Ubuntu" "Debian" "Other"; do
    case $d in
    Ubuntu)
        distro="🟠 Ubuntu"
        package_manager="apt-get"
        package_manager_install_flag="install"
        break
        ;;
    Debian)
        distro="🔴 Debian"
        package_manager="apt-get"
        package_manager_install_flag="install"
        break
        ;;
    Other)
        distro="❓️ Other"
        echo "Other distributions of Linux are not offically supported, but may work just fine"
        read -p "What's your distribution? (ie. Arch Linux / Monjaro)" distro
        read -p "What's your package manager? (ie. Pacman)" package_manager
        read -p "What's the flag for installing with $package_manager?" package_manager_install_flag
        echo "Trying to continue..."
        break
        ;;
    esac
done

# Ask if they want to setup symlinks with stow
printf "\n🦬 Do you wish to install stow (for symlinks)?\n"
select yn in "Yes" "No"; do
    case $yn in
    Yes)
        # Install stow, if not already installed
        stow_installed=$(which stow)
        if [ -z "$stow_installed" ]; then
            install "stow"
        else
            echo "Stow is already installed"
        fi

        # Setup symlinks in home dir to .dotfiles
        function stow_load {
            cd $dotfiles_location
            stow -vt $1 $2
        }

        printf "\n🔗 Settings up links\n"
        mkdir -p ~/scripts
        stow_load ~/scripts scripts
        stow_load ~ common
        stow_load ~ cron
        stow_load ~ oh-my-zsh
        stow_load ~ bash
        stow_load ~ vim
        stow_load ~ x
        printf "Done!"
        break
        ;;
    No)
        echo "Stow will not be installed."
        exit
        ;;
    esac
done

# Install composer
php_installed=$(which php)
composer_installed=$(which composer)
printf "\n 🐘 Do you wish to install composer (for PHP)?\n"
select yn in "Yes" "No"; do
    case $yn in
    Yes)
        if [ -z "$php_installed" ]; then
            printf "\n\nCould not find PHP, do you want to install it now?\n"
            select php_yn in "Yes" "No"; do
                case $php_yn in
                Yes)
                    install "php-fpm php-mbstring php-dom"
                    break
                    ;;
                No)
                    break
                    ;;
                esac
            done
        fi

        if [ -z "$composer_installed" ]; then
            printf "\n\nStarting composer install...\n"

            composer_install_dir=""
            read -p "Where would you like to install composer? Default is in ~/bin: " composer_install_dir

            if [ -z "$composer_install_dir" ]; then
                composer_install_dir="$HOME/bin"
            fi

            EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
            php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
            ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

            if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]; then
                echo >&2 'ERROR: Invalid installer signature'
                rm composer-setup.php
                exit 1
            fi

            php composer-setup.php --install-dir="$composer_install_dir"
            rm composer-setup.php

            # Composer shortcut
            echo "#!/bin/bash" >>$HOME/bin/composer
            echo "php $HOME/bin/composer.phar" >>$HOME/bin/composer
            chmod 755 "$HOME/bin/composer"

            echo "Composer is now installed"
        else
            echo "Composer is already installed"
        fi

        break
        ;;
    No)
        echo "Composer will not be installed."
        exit
        ;;
    esac
done

printf "\n\n✨ All done! ✨\n\n"
