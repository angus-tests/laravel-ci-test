#!/bin/sh


# Create .env file from environment variables
printenv | awk -F "=" 'NF==2 && $2 !~ /[\n\t ]/' > .env

# Run our artisan commands
php artisan route:clear
php artisan config:clear
php artisan view:clear

php artisan storage:link
php artisan optimize

php artisan migrate --force
chmod -R 777 storage

# Finally, start PHP-FPM and nginx
php-fpm -D &&  nginx -g "daemon off;"
