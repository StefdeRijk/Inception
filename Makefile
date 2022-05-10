SHELL := /bin/bash

all:
	echo "127.0.0.1 sde-rijk.42.fr" > /etc/hosts
	docker-compose -f srcs/docker-compose.yml up --build

stop:
	docker-compose -f srcs/docker-compose.yml stop

kill:
	docker-compose -f srcs/docker-compose.yml kill

rmv:
	rm -rf ~/data/db
	rm -rf ~/data/wp

purge:
	yes | docker system prune -a 


re: kill all
renovolume: kill rmv all
recomplete: kill purge rmv all
