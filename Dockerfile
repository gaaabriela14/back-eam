FROM spittet/php-postgresql:latest

RUN mkdir /laravel
COPY . /laravel
WORKDIR /laravel
RUN service postgresql start

RUN curl -sS https://getcomposer.org/installer | php

RUN mv composer.phar /usr/local/bin/composer
EXPOSE 8000
RUN chmod +x /usr/local/bin/composer
RUN composer install
CMD sh configuration.sh
