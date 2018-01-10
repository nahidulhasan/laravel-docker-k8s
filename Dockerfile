FROM php:7.0-fpm

RUN docker-php-ext-install pdo_mysql
RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
    && docker-php-ext-install -j$(nproc) mcrypt \
    && docker-php-ext-install -j$(nproc) pdo

RUN apt-get install -y nginx  supervisor && \
    rm -rf /var/lib/apt/lists/*

COPY . /var/www/html
WORKDIR /var/www/html

RUN rm /etc/nginx/sites-enabled/default

COPY /docker/nginx/nginx.conf /etc/nginx/conf.d/default.conf


RUN chmod +x ./entrypoint

ENTRYPOINT ["./entrypoint"]

EXPOSE 80