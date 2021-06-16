FROM ubuntu:16.04
RUN apt-get -y update && apt-get install -y \
apache2 \
php7.4 \
libapache2-mod-php7.4 \
php7.4-bcmath \
php7.4-gd \
php7.4-json \
php7.4-sqlite \
php7.4-mysql \
php7.4-curl \
php7.4-xml \
php7.4-mbstring \
php7.4-zip \
mcrypt
RUN sed -i -e 's/^error_reporting\s*=.*/error_reporting = E_ALL/' /etc/php/7.4/apache2/php.ini
RUN sed -i -e 's/^display_errors\s*=.*/display_errors = On/' /etc/php/7.4/apache2/php.ini
RUN sed -i -e 's/^zlib.output_compression\s*=.*/zlib.output_compression = Off/' /etc/php/7.4/apache2/php.ini
RUN a2enmod rewrite
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
RUN chgrp -R www-data /var/www
RUN find /var/www -type d -exec chmod 775 {} +
RUN find /var/www -type f -exec chmod 664 {} +
RUN rm -rf /var/www/html/*
ADD website/* /var/www/html/
ENTRYPOINT apachectl -D FOREGROUND
