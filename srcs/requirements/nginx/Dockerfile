FROM debian:buster

run apt-get update && apt-get -y install nginx

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN nginx -t
CMD nginx
