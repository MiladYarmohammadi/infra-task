FROM composer:lts AS builder

WORKDIR /app

COPY . .

RUN composer install --no-ansi --no-dev --no-interaction --no-progress --no-scripts --optimize-autoloader

FROM php:8.2-alpine

WORKDIR /app

COPY --from=builder /app /app

#RUN pecl install redis && docker-php-ext-enable redis

EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000
