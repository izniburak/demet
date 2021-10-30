all: help

init:
	@cp ./.env.example .env
	@cp ./docker-compose.yml.dist docker-compose.yml
	@echo ".env and docker-compose.yml files have been created with default values."
generate:
	@./.demet/demet.sh 
clean:
	@rm -rf docker-compose.yml .env 
	@echo "Your docker-compose.yml and .env files have been removed."
build:
	@docker compose up -d --build
up:
	@docker compose up -d
down:
	@docker compose down
restart:
	@docker compose restart
ps:
	@docker compose ps
webserver:
	@docker exec -it "demet-php" /bin/bash
run:
	@docker exec -it "$(c)" /bin/bash

help:
	@echo "DEMET - Lightweight LAMP & LEMP stacks to use on Docker.\n"
	@echo "You can use following parameters:"
	@echo " - build     : Start to build docker images in your docker-compose file."
	@echo " - clean     : Clean your docker-compose file."
	@echo " - down      : Down your containers. (Like 'docker compose down')"
	@echo " - generate  : Generate a new docker-compose file with images what you want to use."
	@echo " - init      : Create .env and docker-compose.yml files."
	@echo " - ps        : List containers."
	@echo " - restart   : Restart all containers."
	@echo " - run       : Run spesific container. (make run c=<container-name>)"
	@echo " - up        : Up your containers. (Like 'docker compose up -d')"
	@echo " - webserver : Enter your PHP container.\n"
