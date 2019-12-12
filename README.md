# demet

Simple and useful **LAMP & LEMP** stacks to use on Docker container via Docker Compose. With **PostgreSQL, MongoDB, Redis, RabbitMQ, PhpMyAdmin, PGAdmin and Mongo-Express.** You can generate your environment whatever you want. 

| Service       | Container Name   | Default Ports | Version       | Description                      |
|---------------|------------------|---------------|---------------|----------------------------------|
| Apache Server | demet-apache     | 80 / 443      | 2.4:alpine    | Apache Web Server                |
| Nginx Server  | demet-nginx      | 80 / 443      | latest:alpine | Nginx Web Server                 |
| PHP           | demet-php7       | 9000          | 7.4-fpm       | PHP 7.4-fpm-alpine container     |
| MySQL         | demet-mysql      | 3306          | 8.0           | MySQL Database version 8.0       |
| PhpMyAdmin    | demet-phpmyadmin | 8080          | latest        | MySQL Web UI                     |
| PostgreSQL    | demet-pgsql      | 5432          | 12.0          | PostgreSQL Database version 12.0 |
| PGAdmin       | demet-pgadmin    | 8081          | latest        | PostgreSQL Web UI                |
| MongoDB       | demet-mongodb    | 27017         | latest        | NoSQL database                   |
| Mongo-Express | demet-mongoadmin | 8082          | latest        | MongoDB Web UI                   |
| Redis         | demet-redis      | 6379          | 5.0           |                                  |
| RabbitMQ      | demet-rabbitmq   | 5672 / 15672  | 3-management  |                                  |

Default docker-compose file includes **PHP, Apache, and MySQL** containers.

## usage
Clone this repo and run following command in repo you cloned:

```
$ make
```
Then, configure and generate your docker-compose.yml file as you want.

Now, you must create **.env file** to specify port configuration for the containers you selected. In order to generate **.env file**, you can run following command simply:
```
$ make env
```
Great! **.env** file has been generated.
If you want to change default ports or configuration,
you can edit **.env** file.

Now, You're ready to build the containers you selected.
In order to build containers you selected, you can use following command:
```
$ make build
```
If everything is okay, you can start to use **Demet!**
Let's go to http://localhost .

If you want to enter to PHP container, you can use this command simply instead of `docker exec` command:
```
$ make webserver
```
That's all! Happy coding!

## Notes
- Your project files must be in `./public/` directory.
- You can change `php.ini` settings by editting files in `./docker/php/conf/` directory.
- You can find configuration files of Webserver which you used in `./docker/apache/` or `./docker/nginx/` directory.
- You can find configuration files of other containers in `./docker/` directory as well.
- **Composer, XDebug and OPCache** are included for PHP. You can use these directly.
- If you want to enter to spesific container, you can use this command: 
```
docker exec -it "container-name" /bin/bash
```
- You can use following commands simply in order to `up` or `down` docker-compose instead of `docker-compose up|down`:
```
# for UP your containers
make up

# for DOWN your containers
make down
```
- You can access to container logs from `./logs/` directory.
- You can use following command to clean & delete your **docker-compose** and **.env** files
```
make clean
```

## Contributing
If you have any advice, let me know please.

1. Fork it ( https://github.com/izniburak/demet/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [izniburak](https://github.com/izniburak) İzni Burak Demirtaş - creator, maintainer
- [ulaskilic](https://github.com/ulaskilic) - Contributor
- Mustafa Palavar - Contributor
