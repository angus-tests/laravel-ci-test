# Stage 1: Composer dependencies
FROM composer:2 as composer
WORKDIR /app
COPY . .
RUN composer install --no-interaction --no-dev --prefer-dist --optimize-autoloader
RUN rm -rf /root/.composer/cache

# Stage 2: Frontend build with Node.js
FROM node:14-alpine AS frontend
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
# Copy vendor directory
COPY --from=composer /app/vendor ./vendor
RUN npm run build && npm cache clean --force

# Stage 3: Setup PHP and Laravel
FROM php:8.2-fpm-alpine

# Install system dependencies
RUN apk update && apk add --no-cache \
    curl \
    zip \
    unzip \
    git \
    oniguruma-dev \
    icu-dev \
    libzip-dev \
    nginx

# Configure PHP extensions
RUN docker-php-ext-install \
    pdo_mysql \
    mbstring \
    zip \
    intl

# Copy vendor files from composer stage
COPY --from=composer /app/vendor /var/www/html/vendor

# Copy frontend build files
COPY --from=frontend /app/public/build /var/www/html/public/build

# Copy project files
COPY . /var/www/html

# Set workdir
WORKDIR /var/www/html

# Set folder permissions for Laravel
RUN chown -R www-data:www-data /var/www/html/storage \
    && chown -R www-data:www-data /var/www/html/bootstrap/cache

# Copy the shell script that generates the .env file and starts the app
COPY prod.sh /start.sh
RUN chmod +x /start.sh

# Configure Nginx
COPY nginx.conf /etc/nginx/http.d/app.conf
# Expose port 80
EXPOSE 80

# Start Nginx and PHP-FPM services
CMD /bin/sh /start.sh && nginx -g 'daemon off;'
