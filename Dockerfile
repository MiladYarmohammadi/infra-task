FROM php:8.2-alpine

# Set working directory
WORKDIR /app


# Install PHP extensions
RUN apk --no-cache add autoconf build-base

#RUN apk add nginx \
#  && rm -rf /var/cache/apk/*
#
## This cache location is only used in specific distributions / configurations
#RUN apk add nginx \
#  && rm -rf /etc/apk/cache/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Redis extension
RUN pecl install redis && \
    docker-php-ext-enable redis

# Copy application files
COPY . .

# Install application dependencies
RUN composer install

# Set environment variables from .env file
# ARG APP_ENV=development
# ENV DB_CONNECTION=${DB_CONNECTION}
# ARG REDIS_PORT=6379
# ENV REDIS_HOST=${REDIS_HOST}
#ENV CACHE_DRIVER=redis
#ENV REDIS_HOST=172.17.0.3

# Expose port 8000 for PHP built-in web server
EXPOSE 8000

# Start Redis cache server
CMD php artisan serve --host=0.0.0.0 --port=8000 -vvv
