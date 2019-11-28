# Définition de l'image de base
FROM debian:8

ADD https://wordpress.org/latest.tar.gz /tmp/wordpress.tar.gz

# On reprend les commandes en faisant attention à ce qu'elles puissent
# s'exécuter automatiquement
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apache2 \
        libapache2-mod-php5 \
        php5-mysql && \
    tar xf /tmp/wordpress.tar.gz -C /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log

# Définir la commande à exécuter, elle ne doit pas forker
CMD ["apache2ctl", "-DFOREGROUND"]

EXPOSE 80

VOLUME /var/www/html
WORKDIR /var/www/html
