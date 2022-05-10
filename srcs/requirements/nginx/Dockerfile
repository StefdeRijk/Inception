FROM debian:buster

run apt-get update && apt-get -y install nginx openssl

run apt-get -y install libfcgi0ldbl

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN openssl req -nodes -newkey rsa:4096 -keyout /etc/nginx/key.key -out /etc/nginx/crt.crt -subj "/C=NL/ST=FunkyState/L=BlepCity/O=Bloebla Inc./CN=Ms. Fliebel" -x509

#RUN nginx -t
ENTRYPOINT nginx -g "daemon off;"
