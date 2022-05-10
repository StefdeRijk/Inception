FROM debian:buster

RUN apt-get update && apt-get -y install php-fpm php-mysql php-gd curl lsof libfcgi0ldbl vim wget mariadb-client 
COPY conf/www.conf /etc/php/7.3/fpm/pool.d
RUN mkdir /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www/
RUN mkdir -p /var/www/html

COPY tools/wp.sh /tmp/
RUN chmod 755 /tmp/wp.sh
ENTRYPOINT /tmp/wp.sh
