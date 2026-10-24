FROM php:8.5.12-apache

RUN apt-get update && apt-get dist-upgrade -y \
  && apt-get clean \
  && rm -rf /tmp/* /var/lib/apt/lists/* /var/cache/debconf/*-old \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install mysqli bcmath

RUN { \
        echo 'apc.serializer=igbinary'; \
        echo 'session.serialize_handler=igbinary'; \
        echo 'session.upload_progress.enabled=0'; \
    } >> "${PHP_INI_DIR}/conf.d/docker-php-ext-igbinary.ini";

CMD ["apache2-foreground"]
