FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y apache2
ADD website/* /var/www/html/
ENTRYPOINT apachectl -D FOREGROUND
