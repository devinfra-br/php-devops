FROM devinfrabr/php-8.3:latest

LABEL maintainer="DevInfra Community <>"

# Set the working directory
WORKDIR /var/www/app

# Update and upgrade packages
RUN apk update && apk upgrade

# Copy config files PHP    
COPY ./gitops/build/config/php/php.ini /usr/local/etc/php/php.ini
COPY ./gitops/build/config/php/php-fpm.d/ /usr/local/etc/php-fpm.d/

# Copy config files Nginx
COPY ./gitops/build/config/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./gitops/build/config/nginx/nginx.conf /etc/nginx/nginx.conf

# Copy config files Supervisor
COPY ./gitops/build/config/supervisor/supervisord.conf /etc/supervisord.conf
