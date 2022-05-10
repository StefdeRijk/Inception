FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server

COPY tools/database_script /tmp/
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

ENTRYPOINT ["sh", "/tmp/database_script"]
