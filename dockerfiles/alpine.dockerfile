FROM docker.io/library/php:8.3-rc-zts-alpine 

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN install-php-extensions @composer

RUN apk add --no-cache \
    linux-headers \
    bash \
    curl \
    php83-tokenizer \
    php83-xmlwriter \ 
    php83-session \
    php83-sqlite3 \
    php83-pdo_sqlite \
    # php83-pdo_pgsql \
    php83-mbstring \
    php83-opcache \
    php83-xml \
    php83-dom \
    php83-fileinfo \
    php83-simplexml

RUN docker-php-ext-install pcntl sockets

WORKDIR /app/laravel-example

COPY . /app
RUN chown -R www-data:www-data /app
# RUN php artisan optimize:clear
# RUN php artisan optimize

ENTRYPOINT ["sh", "/app/roadrunner-entrypoint.sh"]
