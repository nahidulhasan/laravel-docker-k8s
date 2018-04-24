FROM php:7.1.3-fpm

RUN apt-get update && apt-get install zlib1g-dev -y \
        libmcrypt-dev \
        libpq-dev \
        libjpeg-dev \
        libpng-dev \
        supervisor \
        git zip \
    && docker-php-ext-install -j$(nproc) mcrypt \
    && docker-php-ext-install -j$(nproc) pdo \
    && docker-php-ext-install -j$(nproc) pdo_pgsql \
    && docker-php-ext-install -j$(nproc) gd


RUN curl -sS https://getcomposer.org/installer | \
php -- --install-dir=/usr/bin/ --filename=composer
