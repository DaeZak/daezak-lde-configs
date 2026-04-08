#!/usr/bin/env bash

set -x

apt-get install -y \
    php8.3 \
    php8.3-bcmath \
    php8.3-bz2 \
    php8.3-cli \
    php8.3-common \
    php8.3-curl \
    php8.3-dev \
    php8.3-gd \
    php8.3-mbstring \
    php8.3-mysql \
    php8.3-opcache \
    php8.3-pgsql \
    php8.3-phpdbg \
    php8.3-sqlite3 \
    php8.3-zip

sudo pecl channel-update pecl.php.net
pecl install apcu

pushd /etc/php/8.3/mods-available/
echo "extension=apcu.so" >> apcu.ini
echo "apc.enable_cli=1" >> apcu.ini
popd

pushd /etc/php/8.3/cli/conf.d/
ln -s /etc/php/8.3/mods-available/apcu.ini 15-apcu.ini
popd

cd /tmp
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'c8b085408188070d5f52bcfe4ecfbee5f727afa458b2573b8eaaf77b3419b0bf2768dc67c86944da1544f06fa544fd47') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/bin/composer
chown root:root /usr/bin/composer
chmod 755 /usr/bin/composer

