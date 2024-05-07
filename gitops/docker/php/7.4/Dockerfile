FROM php:7.4-fpm-alpine

ENV REDIS_VERSION=5.3.7 \
    MONGODB_VERSION=1.14.1 \
    MEMCACHED_VERSION=3.2.0 \
    RDKAFKA_VERSION=6.0.3 \
    AMQP_VERSION=1.11.0 \
    XDEBUG_VERSION=3.1.6 \
    GRPC_VERSION=1.33.1 \
    COMPOSER_VERSION=2.0.8

LABEL maintainer="DevInfra Community <"

COPY ./gitops/docker/php/7.4/config/entrypoint.sh /entrypoint.sh

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
            libzip-dev \
		    php-curl \
		    php-openssl \
		    php-iconv \
		    php-json \
            php-odbc \
            php-tidy \
            php-soap \
            php-bz2 \
            php-gd \
            php-zlib \
		    php-mbstring \
		    php-phar \
            php-xml \
            php-xmlreader \
            php-xmlwriter \
            php-simplexml \
            php-tokenizer \
            php-pgsql \
            php-sodium \
            php-pcntl \
            php-ctype \
            php-sockets \
            php-session \
            php-fileinfo \
            php-mysqlnd \
            php-mysqli \
            php-pdo_mysql \
            php-pdo_pgsql \
            php-pdo_sqlite \
            php-sockets \
            php-ldap \
            php-intl \
            php-pear \
            php-opcache \
		    php-dom --repository http://nl.alpinelinux.org/alpine/edge/testing/ && rm /var/cache/apk/* \
            && docker-php-ext-install mysqli pdo pdo_mysql pdo_pgsql zip sockets exif bcmath pcntl \

            && docker-php-ext-configure gd \
            --with-freetype=/usr/include/ \
            --with-jpeg=/usr/include/ \
            && docker-php-ext-install -j$(nproc) gd \
            && docker-php-ext-enable gd \
            
            && pecl install --onlyreqdeps --nobuild redis-${REDIS_VERSION}  \
            && pecl install igbinary \
            && cd "$(pecl config-get temp_dir)/redis" \
            && phpize \
            && ./configure --enable-redis-igbinary \
            && make && make install  \

            && pecl install --onlyreqdeps --nobuild mongodb-${MONGODB_VERSION}  \
            && cd "$(pecl config-get temp_dir)/mongodb" \
            && phpize \
            && ./configure --enable-mongodb \
            && make && make install  \

            && pecl install --onlyreqdeps --nobuild memcached-${MEMCACHED_VERSION}  \
            && cd "$(pecl config-get temp_dir)/memcached" \
            && phpize \
            && ./configure --enable-memcached \
            && make && make install  \

            && pecl install --onlyreqdeps --nobuild rdkafka-${RDKAFKA_VERSION}  \
            && cd "$(pecl config-get temp_dir)/rdkafka" \
            && phpize \
            && ./configure --enable-rdkafka \
            && make && make install  \

            && pecl install --onlyreqdeps --nobuild amqp-${AMQP_VERSION}  \
            && cd "$(pecl config-get temp_dir)/amqp" \
            && phpize \
            && ./configure --enable-amqp \
            && make && make install  \

            && pecl install --onlyreqdeps --nobuild xdebug-${XDEBUG_VERSION} \
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
            && apk del --no-cache \
            freetype-dev \
            libjpeg-turbo-dev \
            libpng-dev \
            && rm -rf /tmp/* \
            && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini \
            && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
            && echo "xdebug.log=/var/log/xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini \
            && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
            && echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/xdebug.ini
            #&& composer create-project laravel/laravel /var/www/app/

COPY ./gitops/docker/php/7.4/php/php.ini-development /usr/local/etc/php/php.ini
COPY ./gitops/docker/php/7.4/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./gitops/docker/php/7.4/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./gitops/docker/php/7.4/php/php-fpm.d/ /usr/local/etc/php-fpm.d/
COPY ./gitops/docker/php/7.4/config/supervisord.conf /etc/supervisord.conf

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"] 

