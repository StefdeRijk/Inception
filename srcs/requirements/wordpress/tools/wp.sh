#!/bin/bash
set -x
if [ ! -f "/var/www/html/index.php" ]; then 
	cd /var/www/html/	
	wp core download --allow-root;
	while ! echo "SHOW DATABASES;" | mariadb -hmariadb -u${WP_COOL_LOGIN} -p${WP_COOL_PASSWORD}; do sleep 1; done
	wp config create --dbname=WP --dbuser=${WP_COOL_LOGIN} --dbpass=${WP_COOL_PASSWORD} --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root 
	wp core install --allow-root --url=${WP_URL} --admin_user=${WP_COOL_LOGIN} --admin_password=${WP_COOL_PASSWORD} --title=Cool_website --admin_email=somemail@42.fr
	wp user create ${WP_USER_LOGIN} somemail2@42.fr --allow-root --user_pass=${WP_USER_PASSWORD};
fi
/usr/sbin/php-fpm7.3 --nodaemonize
