FROM php:8.1-fpm

RUN mkdir /app \
    && usermod -d /app www-data \
    && chown -R www-data:www-data /app

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y git zip unzip libzip-dev libxml2 libxml2-dev libxslt-dev libsodium-dev libbz2-dev msmtp \
    && docker-php-ext-install zip xsl sodium bz2

RUN pecl install apcu xdebug \
    && docker-php-ext-enable apcu opcache

RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install mysqli pdo pdo_mysql soap opcache exif intl bcmath sockets
RUN docker-php-ext-install calendar gettext pcntl sysvmsg sysvsem sysvshm
RUN pecl install redis \
    && docker-php-ext-enable redis

RUN echo "opcache.memory_consumption=256" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini \
    && echo "opcache.interned_strings_buffer=16" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini \
    && echo "opcache.revalidate_freq=0" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini \
    && echo "opcache.max_accelerated_files=16229" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

COPY .docker/php/conf.d/php.ini $PHP_INI_DIR/conf.d/php.ini
COPY .docker/php/conf.d/php-cli.ini $PHP_INI_DIR/conf.d/php-cli.ini
COPY .docker/php/conf.d/xdebug.ini $PHP_INI_DIR/conf.d/xdebug.ini

WORKDIR /app

COPY .docker/php/docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
CMD ["php-fpm"]
