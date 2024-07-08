FROM php:8.3.9-apache

RUN apt-get update && apt-get dist-upgrade -y \
  && apt-get clean \
  && rm -rf /tmp/* /var/lib/apt/lists/* /var/cache/debconf/*-old \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install mysqli bcmath

CMD ["apache2-foreground"]
