#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres PROD..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL PROD started"
fi

#python manage.py flush --no-input
#python manage.py migrate

exec "$@"