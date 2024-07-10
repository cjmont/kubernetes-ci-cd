#!/bin/sh

# Ejecutar las migraciones
python manage.py makemigrations
python manage.py migrate

# Ejecutar el servidor
exec "$@"
