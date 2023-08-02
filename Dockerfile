# Stage 1: Composer dependencies
FROM composer:latest as composer
WORKDIR /app
COPY . .
RUN composer install --no-interaction --no-dev --prefer-dist --optimize-autoloader

# Stage 2: Frontend build with Node.js
FROM node:14 AS frontend
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --no-optional
COPY . .
RUN npm run build


# Stage 3: Setup PHP and Laravel
FROM php:8.2-fpm
WORKDIR /var/www/html
RUN apt-get update && apt-get install -y \
    curl \
    zip \
    unzip \
    git \
    libicu-dev \
    libonig-dev \
    libzip-dev
RUN docker-php-ext-install \
    pdo_mysql \
    mbstring \
    zip \
    intl
COPY --from=composer /app/vendor /var/www/html/vendor
COPY . .
COPY --from=frontend /app/public/build /var/www/html/public/build
CMD ["php-fpm"]
EXPOSE 9000
