all: help

env:
	@cp ./.env.example .env
	@echo ".env file has been created with default settings."
generate:
	@./.demet/demet.sh 
clean:
	@rm -rf docker-compose.yml .env 
	@echo "Your docker-compose.yml and .env files have been removed."
build:
	@docker-compose up -d --build
up:
	@docker-compose up -d
down:
	@docker-compose down
webserver:
	@docker exec -it "demet-php" /bin/bash

help:
	@echo "DEMET - Lightweight LAMP & LEMP stacks to use on Docker.\n"
	@echo "You can use following parameters:"
	@echo " - build     : Start to build docker images in your docker-compose file."
	@echo " - clean     : Clean your docker-compose file."
	@echo " - down      : Down your containers. (Like 'docker-compose down')"
	@echo " - env       : Create a new .env file."
	@echo " - generate  : Generate a new docker-compose file with images what you want to use."
	@echo " - up        : Up your containers. (Like 'docker-compose up -d')"
	@echo " - webserver : Enter your PHP container.\n"
	

