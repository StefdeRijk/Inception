SHELL := /bin/bash

all:
	mkdir -p /home/sde-rijk/data/wp
	mkdir -p /home/sde-rijk/data/db
	chown -R root:root /home/sde-rijk
	echo "127.0.0.1 sde-rijk.42.fr" > /etc/hosts
	docker-compose -f srcs/docker-compose.yml up --build

stop:
	docker-compose -f srcs/docker-compose.yml stop

kill:
	docker-compose -f srcs/docker-compose.yml kill

rmv:
	docker volume rm $$(docker volume ls -q) || true
	rm -rf /home/sde-rijk/data/wp/*
	rm -rf /home/sde-rijk/data/db/*

purge:
	yes | docker system prune -a 
	docker rm $$(docker ps -qa) || true
	docker rmi -f $$(docker images -qa) || true
	docker volume rm $$(docker volume ls -q) || true
	docker network rm $$(docker network ls -q) 2>/dev/null || true

re: kill all
renovolume: kill rmv all
recomplete: kill purge rmv all
