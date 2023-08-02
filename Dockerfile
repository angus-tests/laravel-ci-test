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
WORKDIR /var/www/html
RUN apk update && apk add --no-cache \
    curl \
    zip \
    unzip \
    git \
    oniguruma-dev \
    icu-dev \
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
