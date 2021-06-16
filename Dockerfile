FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-zip
RUN rm -rf /var/www/html/*
ADD website/* /var/www/html/
ENTRYPOINT apachectl -D FOREGROUND
