all: generate

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
	@docker exec -it "demet-php7" /bin/bash

