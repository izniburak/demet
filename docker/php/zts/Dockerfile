FROM php:7.4-zts-alpine
MAINTAINER İzni Burak Demirtaş <izniburak@gmail.com>

ENV PATH="./vendor/bin:${PATH}"

COPY php-zts.ini /usr/local/etc/php/conf.d/

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/local/include/ \
    && echo $TZ > /etc/timezone \
    && apt-get update \
    && apt-get -y --no-install-recommends install apt-utils curl zip unzip \
        procps git nano wget sqlite3 \
        zlib1g-dev libgpgme11 libgpgme11-dev \
        libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libreadline-dev \
        libgmp-dev libmhash-dev libpng-dev libxml2-dev libssl-dev libzip-dev libpq-dev \
        re2c apache2-utils openssl autoconf pkg-config \
    && docker-php-ext-install pdo_mysql opcache zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install soap mysqli intl bcmath pcntl \
    && docker-php-ext-configure gmp \
    && docker-php-ext-install gmp \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql pgsql 

RUN echo "### Installing PHP and its Extensions are completed. ###"

# Add Mongodb, Redis, XDebug
RUN pecl install mongodb redis xdebug \ 
    && docker-php-ext-enable xdebug redis mongodb opcache 

RUN echo "### Installing MongoDB, Redis and XDebug Extensions are completed. ###"

# Add PHP Pthreads module
RUN git clone https://github.com/krakjoe/pthreads.git \
        && ( \
            cd pthreads \
            && phpize \
            && ./configure --enable-pthreads \
            && make -j$(nproc) \
            && make install \
        ) \
        && rm -r pthreads \
        && docker-php-ext-enable pthreads
RUN echo "### Installing pThread Extension is completed. ###" 

# Add Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/bin --filename=composer && chmod +x /usr/bin/composer 
RUN echo "### Installing Composer is completed. ###" 

USER root

RUN usermod -u 1000 www-data

WORKDIR /var/www/scripts

EXPOSE 9001

ENTRYPOINT ["/bin/sh"]
