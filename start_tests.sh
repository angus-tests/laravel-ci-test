#!/bin/sh

# Create .env file from environment variables
# printenv | awk -F "=" 'NF==2 && $2 !~ /[\n\t ]/' > .env # - Uncomment to load .env from env variables passed into container at runtime

# Run our artisan commands
php artisan route:clear
php artisan config:clear
php artisan view:clear

php artisan migrate --force
chmod -R 777 storage

php artisan db:seed --force
php artisan test
