FROM ubuntu:16.04
RUN apt-get -y update && apt-get install -y \
apache2
RUN rm -rf /var/www/html/*
ADD website/* /var/www/html/
ENTRYPOINT apachectl -D FOREGROUND
