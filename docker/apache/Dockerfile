FROM httpd:2.4-alpine

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash

# Copy apache vhost file to proxy php requests to php-fpm container
COPY docker/apache/httpd.conf /usr/local/apache2/conf/demo.httpd.conf
RUN echo "Include /usr/local/apache2/conf/demo.httpd.conf" \
    >> /usr/local/apache2/conf/httpd.conf
