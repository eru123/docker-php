FROM php:8.1.0-apache

RUN a2enmod rewrite
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    libicu-dev \ 
    libxml2-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install   mysqli pdo pdo_mysql zip intl opcache xml gd
RUN docker-php-ext-enable    mysqli pdo pdo_mysql zip intl opcache xml gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY php.ini-development /usr/local/etc/php/
COPY php.ini-production /usr/local/etc/php/

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
