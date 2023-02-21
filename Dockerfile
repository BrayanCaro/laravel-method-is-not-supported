FROM php:7.4-apache

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
COPY laravel-site.conf /etc/apache2/sites-available/laravel-site.conf

RUN apt-get update && apt-get install -qq \
    # libzip-dev, unzip, Requeridas para composer, vease https://stackoverflow.com/questions/64500293/installing-php-zip-on-a-php7-4-fpm-image
    libzip-dev \
    unzip \
    && docker-php-ext-install zip \
    && a2enmod rewrite \
    && a2dissite 000-default \
    && a2ensite laravel-site \
    && service apache2 restart

RUN composer create-project laravel/laravel:^8 example-app \
    && chmod g+rwX -R example-app \
    && chown :www-data -R example-app

WORKDIR /var/www/html/example-app

# The .htaccess file is not mandatory unless we use nested routes, eg: http://localhost:8080/example-app/foo/bar
# COPY .htaccess public/

RUN php artisan key:generate \
    # Guardar en cache las rutas genera un error
    && php artisan route:cache
