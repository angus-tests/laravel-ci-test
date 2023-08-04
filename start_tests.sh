#!/bin/sh

# Create .env file from environment variables
# RUN printenv | grep -v "no_proxy" > .env # - Uncomment to load .env from env variables passed into container at runtime

# Run our artisan commands
php artisan route:clear
php artisan config:clear
php artisan view:clear

php artisan storage:link
php artisan optimize

php artisan migrate --force
chmod -R 777 storage

php artisan db:seed --force
php artisan test
