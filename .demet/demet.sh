#!/bin/sh 

template="./.demet/containers.yml"
compose="./docker-compose.yml"
patterns=""

echo "DEMET - Docker-Compose File Generating Tool\n"

if [ -f "$compose" ]; then
    echo "Docker-compose file has already been generated."
    read -p "Do you want to regenerate it? [y|n] (Default: n) : " answer
    if [ "$answer" != 'y' ]; then
      exit
    fi
    echo "\n"
fi

read -p "Which webserver do you want to use? [apache|nginx] (Default: apache) : " answer
if [ "$answer" = 'nginx' ]; then
  echo "Okay, Nginx will be used.\n"
  patterns="s/\${WEBSERVER}/nginx/g;"
else
  echo "Okay, Apache will be used.\n"
  patterns="s/\${WEBSERVER}/apache/g;"
fi

read -p "Which version of PHP do you want to use? (Default: 8.3) [8.1|8.2|8.3] : " answer
if [ "$answer" = '8.1' ]; then
  echo "Okay, PHP 8.1 will be used.\n"
  patterns="$patterns/#--PHP83--#/,/#--\/PHP83--#/d;"
  patterns="$patterns/#--PHP82--#/,/#--\/PHP82--#/d;"
elif [ "$answer" = '8.2' ]; then
  echo "Okay, PHP 8.2 will be used.\n"
  patterns="$patterns/#--PHP81--#/,/#--\/PHP81--#/d;"
  patterns="$patterns/#--PHP83--#/,/#--\/PHP83--#/d;"
else
  echo "Okay, PHP 8.3 will be used.\n"
  patterns="$patterns/#--PHP81--#/,/#--\/PHP81--#/d;"
  patterns="$patterns/#--PHP82--#/,/#--\/PHP82--#/d;"
fi

read -p "Do you want to use MySQL/MariaDb? [y|n] (Default: n) : " answer
if [ "$answer" = 'y' ]; then
  read -p "Which image do you want to use? [mysql|mariadb] (Default: mysql) : " answer
  if [ "$answer" = 'mariadb' ]; then
    echo "Okay, MariaDb will be used.\n"
    patterns="$patterns/#--MYSQL-IMAGE--#/,/#--\/MYSQL-IMAGE--#/d;"
  else
    echo "Okay, MySQL will be used.\n"
    patterns="$patterns/#--MARIADB-IMAGE--#/,/#--\/MARIADB-IMAGE--#/d;"
  fi
  read -p "Do you want to use PhpMyAdmin? [y|n] (Default: n) : " answer
  if [ "$answer" = 'y' ]; then
    echo "Okay, PhpMyAdmin will be added.\n"
  else
    echo "Okay, PhpMyAdmin won't be added.\n"
    patterns="$patterns/#--PHPMYADMIN--#/,/#--\/PHPMYADMIN--#/d;"
  fi
else
  echo "Okay, MySQL won't be added.\n"
  patterns="$patterns/#--MYSQL--#/,/#--\/MYSQL--#/d;"
  patterns="$patterns/#--PHPMYADMIN--#/,/#--\/PHPMYADMIN--#/d;"
fi

read -p "Do you want to use PostgreSQL? [y|n] (Default: n) : " answer
if [ "$answer" = 'y' ]; then
  echo "Okay, PostgreSQL will be added.\n"
  read -p "Do you want to use PGAdmin for PostgreSQL? [y|n] (Default: n) : " answer
  if [ "$answer" = 'y' ]; then
    echo "Okay, PGAdmin will be added.\n"
  else 
    echo "Okay, PGAdmin won't be added.\n"
    patterns="$patterns/#--PGADMIN--#/,/#--\/PGADMIN--#/d;"
  fi
else 
  echo "Okay, PostgreSQL won't be added.\n"
  patterns="$patterns/#--PGSQL--#/,/#--\/PGSQL--#/d;"
  patterns="$patterns/#--PGADMIN--#/,/#--\/PGADMIN--#/d;"
fi

read -p "Do you want to use MongoDB? [y|n] (Default: n) : " answer
if [ "$answer" = 'y' ]; then
  echo "Okay, MongoDB will be added.\n"
  read -p "Do you want to use Mongo-Express for MongoDB? [y|n] (Default: n) : " answer
  if [ "$answer" = 'y' ]; then
    echo "Okay, Mongo-Express will be added.\n"
  else 
    echo "Okay, Mongo-Express won't be added.\n"
    patterns="$patterns/#--MONGOEXPRESS--#/,/#--\/MONGOEXPRESS--#/d;"
  fi
else 
  echo "Okay, MongoDB won't be added.\n"
  patterns="$patterns/#--MONGODB--#/,/#--\/MONGODB--#/d;"
  patterns="$patterns/#--MONGOEXPRESS--#/,/#--\/MONGOEXPRESS--#/d;"
fi

read -p "Do you want to use Redis? [y|n] (Default: n) : " answer
if [ "$answer" = 'y' ]; then
  echo "Okay, Redis will be added.\n"
else 
  echo "Okay, Redis won't be added.\n"
  patterns="$patterns/#--REDIS--#/,/#--\/REDIS--#/d;"
fi

read -p "Do you want to use RabbitMQ? [y|n] (Default: n) : " answer
if [ "$answer" = 'y' ]; then
  echo "Okay, RabbitMQ will be added.\n"
else 
  echo "Okay, RabbitMQ won't be added.\n"
  patterns="$patterns/#--RABBITMQ--#/,/#--\/RABBITMQ--#/d;"
fi

sed -e "$patterns" $template > $compose 

echo "Great! docker-compose file has been generated."
echo "Now, you can configure .env file as you want and build your containers via 'make build' command."
