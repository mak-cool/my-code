FROM debian:9
WORKDIR /var/www/html
RUN apt -y update
RUN apt -y install apache2
RUN apt -y install wget
RUN apt -y install apt-transport-https lsb-release ca-certificates
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN apt -y update
COPY . /var/www/html/
RUN chmod -R 777 /var/www/html/
RUN cat apache.conf > /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
RUN service apache2 restart
CMD ["apachectl", "-D", "FOREGROUND"]
