#!/bin/sh
# Get PHP Version major.minor format (Structure is Major.Minor.Release) 
# We want format like 8.0 or 7.4 not 8 or 8.1.2
PHP_VERSION_MAJOR_MINOR=$(php -r 'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;')
# If the enviro var named "dev" is true then lets install vscode dev tools 
# if [ "$dev" = true ] ; then
#     # cp -r /var/www/laravel/thunder-tests/ /var/data
#     # chmod -R 777 /var/data/thunder-tests/
#     # chmod -R 777 /var/www/laravel/storage/logs/central_logging/
#     # /var/www/laravel/download-vs-code-server.sh
#     apt-get update
#     apt-get install php${PHP_VERSION_MAJOR_MINOR}-xdebug -y
#     echo "[xdebug]
# xdebug.mode = debug
# xdebug.start_with_request = yes
# xdebug.log_level = 0" >> /etc/php/${PHP_VERSION_MAJOR_MINOR}/cli/php.ini
#     echo "[xdebug]
# xdebug.mode = debug
# xdebug.start_with_request = yes
# xdebug.log_level = 0">> /etc/php/${PHP_VERSION_MAJOR_MINOR}/apache2/php.ini
#     # apt-get update
#     # apt install libssl1.0.0 libkrb5-3 zlib1g libicu[0-9][0-9] gnome-keyring libsecret-1-0 desktop-file-utils x11-utils -y
#     # apt upgrade -y
#     # php artisan db:create telescope
#     # php artisan migrate
#     git remote set-url https://github.com/ArvigEnterprises/omar-test.git
#     git fetch --all
#     git checkout main
# fi
# copy env if necessary
cd /var/www/laravel
if [ -f "File.txt" ]; 
then
echo "env file found"
else
echo "env file not found. copying example."
cp .env.example .env
php artisan key:generate
fi
# startup our primary app
apachectl -D FOREGROUND