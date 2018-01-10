FROM php:7.0-fpm

RUN docker-php-ext-install pdo_mysql
RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
    && docker-php-ext-install -j$(nproc) mcrypt \
    && docker-php-ext-install -j$(nproc) pdo



FROM mysql

RUN apt-get install -y mysql-server \
    -y mysql-client


FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf