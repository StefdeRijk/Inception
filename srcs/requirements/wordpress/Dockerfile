FROM debian:buster

RUN apt-get update && apt-get -y install wordpress && apt-get -y install php-fpm

RUN adduser -S nginx && addgroup -S nginx
COPY conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
