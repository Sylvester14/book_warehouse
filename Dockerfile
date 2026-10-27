FROM composer:latest AS vendor-stage

WORKDIR /app
COPY composer.json composer.lock ./

ARG APP_ENV=dev
RUN composer install --no-scripts --no-progress --prefer-dist;


FROM webdevops/php-nginx:8.4-alpine


ENV WEB_DOCUMENT_ROOT=/var/www/html/public
ENV APP_ENV=dev

WORKDIR /var/www/html

COPY --from=vendor-stage /app/vendor ./vendor
COPY . .

RUN mkdir -p var/cache var/log && \
    chown -R application:application var/ && \
    chmod -R 775 var/

EXPOSE 80
