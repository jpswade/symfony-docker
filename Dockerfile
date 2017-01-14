FROM php:7-fpm
WORKDIR /var/www/php
ENV COMPOSER_VERSION 1.2.0
CMD ["php-fpm", "-F"]
EXPOSE 9000