FROM php:7.4-apache-bullseye

RUN apt-get update && apt-get install -y vim-nox git links wget openssl && \
    apt-get clean && \
    a2enmod rewrite && \
    a2enmod ssl && \
    a2dissite 000-default && \
    a2ensite default-ssl && \
    docker-php-ext-install mysqli && \
    openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company Inc/CN=example.com" -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem;

RUN git clone --branch v3.3 --single-branch https://github.com/tematres/TemaTres-Vocabulary-Server.git /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    sed -i 's|"localhost"|getenv("DB_HOST")|g' /var/www/html/vocab/db.tematres.php && \
    sed -i 's|"root"|getenv("DB_USER")|g' /var/www/html/vocab/db.tematres.php && \
    sed -i 's|"pass"|getenv("DB_PASS")|g' /var/www/html/vocab/db.tematres.php 

EXPOSE 443
     
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
