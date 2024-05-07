#!/bin/bash

touch /var/log/nginx/error.log
touch /var/log/nginx/access.log
touch /var/log/fpm-php.www.log
touch /var/log/supervisord.log
touch /var/www/app/storage/logs/laravel.log
touch /var/log/fpm-php.www.log
touch /var/log/xdebug.log

chmod -R 777 /var/www/app/storage/*
chmod -R 777 /var/www/app/bootstrap/cache

chmod -R 644 /var/log/nginx/error.log
chmod -R 644 /var/log/nginx/access.log
chmod -R 644 /var/log/fpm-php.www.log
chmod -R 644 /var/log/supervisord.log
chmod -R 644 /var/log/xdebug.lo

# Start supervisord and services
/usr/bin/supervisord