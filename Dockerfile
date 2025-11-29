FROM php:8.5-alpine

ENV TZ="Europe/Berlin"

RUN apk add --no-cache \
    $PHPIZE_DEPS \
    linux-headers \
    openssl-dev\
    curl \
    curl-dev \
    git \
    zip  \
    unzip \
    sqlite \
    sqlite-dev \
    nodejs \
    npm \
    libxml2-dev \
    libzip-dev \
    libpng-dev \
    icu-dev \
    oniguruma-dev

RUN docker-php-ext-install \
    bcmath \
    exif \
    gd \
    intl \
    pdo_mysql \
    pdo_sqlite \
    zip

RUN pecl install pcov \
    && docker-php-ext-enable pcov

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer