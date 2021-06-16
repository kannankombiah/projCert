FROM ubuntu:16.04
RUN apt-get -y update && apt-get install -y \
apache2 \
php7.0 \
libapache2-mod-php7.0 \
php7.0-bcmath \
php7.0-gd \
php7.0-json \
php7.0-sqlite \
php7.0-mysql \
php7.0-curl \
php7.0-xml \
php7.0-mbstring \
php7.0-zip \
mcrypt
RUN sed -i -e 's/^error_reporting\s*=.*/error_reporting = E_ALL/' /etc/php/7.0/apache2/php.ini
RUN sed -i -e 's/^display_errors\s*=.*/display_errors = On/' /etc/php/7.0/apache2/php.ini
RUN sed -i -e 's/^zlib.output_compression\s*=.*/zlib.output_compression = Off/' /etc/php/7.0/apache2/php.ini
RUN a2enmod rewrite
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
RUN chgrp -R www-data /var/www
RUN find /var/www -type d -exec chmod 775 {} +
RUN find /var/www -type f -exec chmod 664 {} +
RUN rm -rf /var/www/html/*
ADD website/* /var/www/html/
ENTRYPOINT apachectl -D FOREGROUND
