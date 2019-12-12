FROM nginx:alpine
MAINTAINER İzni Burak Demirtaş <izniburak@gmail.com>

ADD nginx.conf /etc/nginx/
COPY sites/ /etc/nginx/sites-available/

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && adduser -D -H -u 1000 -s /bin/bash www-data

ARG PHP_UPSTREAM_CONTAINER=demet-php7
ARG PHP_UPSTREAM_PORT=9000

# Set upstream conf and remove the default conf
RUN echo "upstream php-upstream { server ${PHP_UPSTREAM_CONTAINER}:${PHP_UPSTREAM_PORT}; }" > /etc/nginx/conf.d/upstream.conf \
    && rm /etc/nginx/conf.d/default.conf

VOLUME ./logs/webserver /var/log/nginx

EXPOSE 80 443

WORKDIR /etc/nginx

CMD ["nginx"]

