FROM php:8.2-alpine AS builder

WORKDIR /app

RUN apk --no-cache add autoconf build-base

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN pecl install redis && docker-php-ext-enable redis

COPY . .

RUN composer install --no-ansi --no-dev --no-interaction --no-progress --no-scripts --optimize-autoloader

FROM php:8.2-alpine

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000
