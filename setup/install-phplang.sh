#!/usr/bin/env
add-apt-repository ppa:ondrej/php
apt-get update
apt-get install -y \
    php7.3 \
    php7.3-bcmath \
    php7.3-bz2 \
    php7.3-cli \
    php7.3-common \
    php7.3-curl \
    php7.3-dev \
    php7.3-gd \
    php7.3-mbstring \
    php7.3-mysql \
    php7.3-opcache \
    php7.3-pgsql \
    php7.3-phpdbg \
    php7.3-sqlite3 \
    php7.3-zip
pecl install apcu

pushd /etc/php/7.3/mods-available/
echo "extension=apcu.so" >> apcu.ini
echo "apc.enable_cli=1" >> apcu.ini
popd

pushd /etc/php/7.3/cli/conf.d/
ln -s /etc/php/7.3/mods-available/apcu.ini 15-apcu.ini
popd

pushd /tmp
wget https://getcomposer.org/download/1.9.0/composer.phar -O composer.phar
chmod 755 composer.phar
mv composer.phar /usr/bin/composer
chown root:root /usr/bin/composer
popd

