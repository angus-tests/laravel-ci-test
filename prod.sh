#!/bin/sh

# Generate .env file


echo "APP_NAME=${APP_NAME}" > .env
echo "APP_URL=${APP_URL}" >> .env
echo "APP_ENV=${APP_ENV}" >> .env
echo "APP_KEY=${APP_KEY}" >> .env
echo "DB_CONNECTION=${DB_CONNECTION}" >> .env
echo "DB_HOST=${DB_HOST}" >> .env
echo "DB_PORT=${DB_PORT}" >> .env
echo "DB_DATABASE=${DB_DATABASE}" >> .env
echo "DB_USERNAME=${DB_USERNAME}" >> .env
echo "DB_PASSWORD=${DB_PASSWORD}" >> .env


# Run our artisan commands

php artisan route:clear

php artisan route:cache

php artisan config:clear

php artisan config:cache

php artisan view:clear

php artisan view:cache

php artisan storage:link

php artisan migrate --force

php artisan optimize

# Finally, start PHP-FPM and nginx
php-fpm -D &&  nginx -g "daemon off;"
