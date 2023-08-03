#!/bin/sh

# Generate .env file
echo "APP_NAME=${APP_NAME}" > .env
echo "APP_ENV=${APP_ENV}" >> .env
echo "DB_CONNECTION=${DB_CONNECTION}" >> .env
echo "DB_HOST=${DB_HOST}" >> .env
echo "DB_PORT=${DB_PORT}" >> .env
echo "DB_DATABASE=${DB_DATABASE}" >> .env
echo "DB_USERNAME=${DB_USERNAME}" >> .env
echo "DB_PASSWORD=${DB_PASSWORD}" >> .env

# Run artisan commands
php artisan key:generate
php artisan storage:link
php artisan config:cache
php artisan route:cache

# Finally, start PHP-FPM
exec php-fpm
