#!/bin/sh

# create database
touch database/database.sqlite

# Change ownership of the SQLite database file to 'nginx' user and group
chmod 666 database/database.sqlite


# Generate .env file
echo "APP_NAME=Laravellous" > .env
echo "APP_ENV=local" >> .env
echo "APP_DEBUG=true" >> .env
echo "APP_KEY=base64:jJrrg0TdYPPakevpqYVYcOGZVoiIsexEhPw58J+CcyI=" >> .env
echo "DB_CONNECTION=sqlite" >> .env
echo "DB_DATABASE=/var/www/html/database/database.sqlite">> .env
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
