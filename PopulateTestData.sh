#!/bin/bash
set -x
SQL_DIR=$1
SQL_PASSWORD=$2
SQL_CONTAINER=$3
echo $SQL_DIR
echo $SQL_PASSWORD
echo $SQL_CONTAINER
for SQL_FILE in $(find $SQL_DIR -name \*.sql); do mysql -u root --password=$SQL_PASSWORD -h $(sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $SQL_CONTAINER) < $SQL_FILE; done
