FROM php:7.1.33-fpm-alpine

ENV REDIS_VERSION=5.1.1 \
    MONGODB_VERSION=1.6.0 \
    MEMCACHED_VERSION=3.1.5 \
    RDKAFKA_VERSION=4.1.2 \
    AMQP_VERSION=1.9.4 \
    XDEBUG_VERSION=2.9.0 \
    GRPC_VERSION=1.33.1 \
    COMPOSER_VERSION=2.0.8

LABEL maintainer="DevInfra Community <"

COPY ./gitops/docker/php/7.1/config/entrypoint.sh /entrypoint.sh

WORKDIR /var/www/app

RUN apk update && apk upgrade \
            && apk add --no-cache --update --virtual buildDeps autoconf re2c \
            && apk add --no-cache --update --virtual buildDeps $PHPIZE_DEPS \
            && apk --update add \
            gcc \
            make \
            g++ \
            linux-headers \
            zlib-dev \
            protobuf \
            protobuf-dev \
            rabbitmq-c \
            rabbitmq-c-dev \
            bash \
            nginx \
		    curl \
		    git \
            postgresql-dev \
            unit \
            libpq \
            libmemcached \
            libmemcached-dev \
            supervisor \
            librdkafka \
            librdkafka-dev \
            ca-certificates \
            freetype \
            libjpeg-turbo \
            libpng \
            freetype-dev \
            libjpeg-turbo-dev \
            libpng-dev \
		    php7-curl \
		    php7-openssl \
		    php7-iconv \
		    php7-json \
            unit-php7 \
            php7-odbc \
            php7-tidy \
            php7-soap \
            php7-bz2 \
            php7-gd \
            php7-zlib \
		    php7-mbstring \
		    php7-phar \
            php7-xml \
            php7-xmlreader \
            php7-xmlwriter \
            php7-simplexml \
            php7-tokenizer \
            php7-pgsql \
            php7-sodium \
            php7-pcntl \
            php7-ctype \
            php7-sockets \
            php7-session \
            php7-fileinfo \
            php7-xmlrpc \
            php7-mysqlnd \
            php7-mysqli \
            php7-pdo_mysql \
            php7-pdo_pgsql \
            php7-pdo_sqlite \
            php7-sockets \
            php7-redis \
            php7-memcached \
            php7-ldap \
            php7-imagick \
            php7-intl \
            php7-pear \
            php7-dev \
            php7-apcu \
            php7-opcache \
		    php7-dom --repository http://nl.alpinelinux.org/alpine/edge/testing/ && rm /var/cache/apk/* \
            && docker-php-ext-install mysqli pdo pdo_mysql pdo_pgsql\

            && docker-php-ext-configure gd \
            --with-freetype=/usr/include/ \
            --with-jpeg=/usr/include/ \
            && docker-php-ext-install -j$(nproc) gd \
            && docker-php-ext-enable gd \

            && pecl install --onlyreqdeps --nobuild redis-4.1.1  \
            && pecl install igbinary \
            && cd "$(pecl config-get temp_dir)/redis" \
            && phpize \
            && ./configure --enable-redis-igbinary \
            && make && make install  \

            && pecl install --onlyreqdeps --nobuild mongodb-1.2.9  \
            && cd "$(pecl config-get temp_dir)/mongodb" \
            && phpize \
            && ./configure --enable-mongodb \
            && make && make install  \

            && pecl install --onlyreqdeps --nobuild memcached-3.1.1  \
            && cd "$(pecl config-get temp_dir)/memcached" \
            && phpize \
            && ./configure --enable-memcached \
            && make && make install  \

            && pecl install --onlyreqdeps --nobuild rdkafka-3.0.5  \
            && cd "$(pecl config-get temp_dir)/rdkafka" \
            && phpize \
            && ./configure --enable-rdkafka \
            && make && make install  \

            && pecl install --onlyreqdeps --nobuild amqp-1.8.0  \
            && cd "$(pecl config-get temp_dir)/amqp" \
            && phpize \
            && ./configure --enable-amqp \
            && make && make install  \

            && pecl install --onlyreqdeps --nobuild xdebug-2.5.0 \
            && cd "$(pecl config-get temp_dir)/xdebug" \
            && phpize \
            && ./configure --enable-xdebug \
            && make && make install  \

            && docker-php-ext-enable igbinary \
            && docker-php-ext-enable redis \
            && docker-php-ext-enable mongodb \
            && docker-php-ext-enable memcached \
            && docker-php-ext-enable rdkafka \
            && docker-php-ext-enable amqp \
            && docker-php-ext-enable xdebug \
            #&& docker-php-ext-enable grpc \
            
            && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
            && mkdir -p  /run/nginx && touch /run/nginx/nginx.pid \
            && chown -R nginx:nginx /run/nginx/nginx.pid \   
            && chmod +x /entrypoint.sh \
            && apk del buildDeps \ 
            && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini \
            && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
            && echo "xdebug.log=/var/log/xdebug/xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini \
            && echo "xdebug.discover_client_host=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
            && echo "xdebug.client_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini
            #&& composer create-project laravel/laravel /var/www/app/

COPY ./gitops/docker/php/7.1/php/php.ini-development /usr/local/etc/php/php.ini
COPY ./gitops/docker/php/7.1/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./gitops/docker/php/7.1/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./gitops/docker/php/7.1/php/php-fpm.d/ /usr/local/etc/php-fpm.d/
COPY ./gitops/docker/php/7.1/config/supervisord.conf /etc/supervisord.conf
#COPY ./config/info.php /var/www/app/public/info.php

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
## /usr/local/etc
## /etc/nginx 

