#!/bin/sh

# create database
touch db.sqlite

# Generate .env file
echo "APP_NAME=${APP_NAME}" > .env
echo "APP_ENV=${APP_ENV}" >> .env
echo "DB_CONNECTION=sqlite" >> .env
echo "DB_DATABASE=db.sqlite">> .env
echo "DB_FOREIGN_KEYS=true" >> .env


# Run artisan commands
php artisan storage:link
php artisan config:cache
php artisan route:cache

# Run database migrations
php artisan migrate --force

# Start Nginx and PHP-FPM
nginx -g 'daemon off;' &
exec php-fpm
