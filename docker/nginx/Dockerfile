FROM nginx:stable-alpine
LABEL maintainer="İzni Burak Demirtaş <izniburak@gmail.com>"

ADD nginx.conf /etc/nginx/
COPY sites/ /etc/nginx/sites-available/

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash

ARG PHP_CONTAINER
ENV CONTAINER_PHP=${PHP_CONTAINER}

# Set upstream conf and remove the default conf
RUN echo "upstream php-upstream { server ${CONTAINER_PHP}:9000; }" > /etc/nginx/conf.d/upstream.conf \
    && rm /etc/nginx/conf.d/default.conf

EXPOSE 80 443

WORKDIR /etc/nginx

CMD ["nginx"]

