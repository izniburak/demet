# demet

```
        _____  ______ __  __ ______ _______ 
      |  __ \|  ____|  \/  |  ____|__   __|
      | |  | | |__  | \  / | |__     | |   
      | |  | |  __| | |\/| |  __|    | |   
      | |__| | |____| |  | | |____   | |   
      |_____/|______|_|  |_|______|  |_|   
  Lightweight LAMP & LEMP stacks to use on Docker.
```

Simple, lightweight and useful **LAMP & LEMP** stacks to use on Docker via Docker Compose. With **PostgreSQL, MongoDB, Redis, RabbitMQ, PhpMyAdmin, PGAdmin and Mongo-Express.** You can generate your environment in whatever way you desire.

| Service       | Container Name   | Default Ports | Version       | Description                      |
|---------------|------------------|---------------|---------------|----------------------------------|
| Apache Server | demet-apache     | 80 / 443      | 2.4:alpine    | Apache Web Server                |
| Nginx Server  | demet-nginx      | 80 / 443      | stable:alpine | Nginx Web Server                 |
| PHP           | demet-php        | 9000          | 8.1 - 8.2 - 8.3 | PHP-FPM Versions (Default: 8.3)       |
| MySQL         | demet-mysql      | 3306          | 8.0           | MySQL 8.0       |
| MariaDb         | demet-mysql      | 3306          | 10.6           | MariaDb 10.6       |
| PhpMyAdmin    | demet-phpmyadmin | 8080          | latest        | MySQL Web UI                     |
| PostgreSQL    | demet-pgsql      | 5432          | 12.0          | PostgreSQL 12.0. |
| PGAdmin       | demet-pgadmin    | 8081          | 6        | PostgreSQL Web UI (dpage/pgadmin4)               |
| MongoDB       | demet-mongodb    | 27017         | 5        | NoSQL database                   |
| Mongo-Express | demet-mongoadmin | 8082          | latest        | MongoDB Web UI                   |
| Redis         | demet-redis      | 6379          | 6.2           | Redis Database                   |
| RabbitMQ      | demet-rabbitmq   | 5672 / 15672  | 3-management-alpine  | RabbitMQ Message Queue           |

You can change the image versions of the containers via `.env` file.

Default docker-compose file includes **PHP 8, Apache, MySQL and PhpMyAdmin** containers.

Also, host names of all services are demet-`<HOST>`. For example, host name of `demet-mysql` container is `mysql`.

## usage
Clone this repo by using following command:
```
$ git clone https://github.com/izniburak/demet.git && cd demet
```
Now, you must create **.env file** to specify port configuration for the containers you selected. In order to generate **.env file**, you can run following command simply:
```
$ make init
```
Great! **.env** and **docker-compose.yml** files have been generated.
If you want to change default ports or configuration,
you can edit **.env** file.

Then, configure and generate your docker-compose.yml file as you want.

**NOTE:** If you want to use default stack (PHP & Apache & MySQL) skip the following step.
```
$ make generate
```

Now, You're ready to build the containers you selected.
In order to build the containers, you can use following command:
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

- You can change `php.ini` settings by editting files in `./docker/php<VERSION>/conf/` directory.

- If you need new extension for PHP, you can update `./docker/php<VERSION>/Dockerfile` file and add a new extension you want.

- You can find configuration files of Webserver which you used in `./docker/apache/` or `./docker/nginx/` directory.

- You can find configuration files of other containers in `./docker/` directory as well.

- **Composer, XDebug and OPCache** are included for PHP. You can use these directly.

- If you want to enter to spesific container, you can use this command:
```
$ make run c=<container-name>
```

- You can check the List of the containers for your setup:
```
$ make ps
```

- You can use following commands simply in order to `up` or `down` docker-compose instead of `docker-compose up|down`:
```
# for UP your containers
$ make up

# for DOWN your containers
$ make down
```

- If you need to restart all container, you can use this command:
```
$ make restart
```

- You can access to container logs from `./logs/` directory.

- You can use following command to clean & delete your **docker-compose** and **.env** files
```
$ make clean
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
