FROM php:7-fpm
MAINTAINER james@wade.be
WORKDIR /var/www/html
# Install and enable the intl extension (used for validators).
RUN apt-get update \
  && apt-get install -y zlib1g-dev libicu-dev g++ \
  && docker-php-ext-configure intl \
  && docker-php-ext-install intl
# Install and/or enable a PHP accelerator (highly recommended).
RUN apt-get install -y php-apc
#  To change settings, create a "php.ini".
ADD https://raw.githubusercontent.com/php/php-src/master/php.ini-production /etc/php.ini
# Set short_open_tag to off in php.ini*.
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php.ini
# NOTE: You should have "cgi.fix_pathinfo = 0;" in php.ini
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php.ini
CMD ["php-fpm", "-F"]