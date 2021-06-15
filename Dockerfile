FROM php:7.2-apache
RUN apt-get update
ADD /var/www/html
ENTRYPOINT apachectl -D FOREGROUND
COPY website/* /var/www/html/
