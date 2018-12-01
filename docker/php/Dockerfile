FROM php:7.2-fpm-stretch

ENV PATH="./vendor/bin:${PATH}"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/local/include/ \
    && echo $TZ > /etc/timezone \
    && apt-get update \
    && apt-get -y --no-install-recommends install apt-utils \
        procps \
        git \
        vim \
        nano \
        sqlite3 \
        zip \
        zlib1g-dev \
        libgpgme11 \
        libgpgme11-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libgmp-dev \
        re2c \
        libmhash-dev \
        libpng-dev \
        libxml2-dev \
        apache2-utils \
        openssl \
        autoconf \ 
        pkg-config \
        libssl-dev \
    && docker-php-ext-install mbstring iconv pdo pdo_mysql opcache zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install soap \
    && docker-php-ext-install pcntl \
    && docker-php-ext-configure gmp \
    && docker-php-ext-install gmp \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install json \
    && docker-php-ext-install intl \
    && docker-php-ext-install bcmath

RUN pecl install mongodb \ 
    && pecl install redis 

RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/bin --filename=composer && chmod +x /usr/bin/composer 

USER root

RUN usermod -u 1000 www-data

EXPOSE 9000

WORKDIR /var/www/html

CMD ["php-fpm"]