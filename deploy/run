#!/bin/sh
set -e
service nginx restart
/usr/bin/supervisord &
php-fpm
