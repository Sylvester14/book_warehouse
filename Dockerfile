# Установка базового образа PHP
FROM php:8.5-fpm AS symfony_php

# Установка системных зависимостей и PHP расширений
RUN apt-get update && apt-get install -y \
    git unzip libicu-dev libpq-dev libzip-dev \
    && docker-php-ext-install intl pdo_pgsql zip

# Установка Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/symfony

# 2. Сборка проекта
FROM symfony_php AS symfony_deps

# Установка зависимостей проекта
COPY composer.json composer.lock symfony.lock ./
RUN composer install --prefer-dist --no-dev --no-scripts --no-progress --no-interaction

# Копирование кода приложения
COPY . .
# Обновляем данные Composer
RUN composer dump-autoload --classmap-authoritative --no-dev

# 3. Финальный production-образ приложения
FROM symfony_php AS symfony_prod

ENV APP_ENC=prod
ENV APP_DEBUG=0

WORKDIR /var/www/symfony

COPY --from=symfony_deps /var/www/symfony ./

RUN mkdir -p var/cache var/log \
    && chmod -R 777 var/

EXPOSE 9000
CMD ["php-fpm"]