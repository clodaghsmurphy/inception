FROM debian:buster
EXPOSE 9000

WORKDIR /var/www/html

RUN apt update && apt install -y php-fpm php7.3 \
    wget curl \
    mariadb-client php-mysqli 

COPY /www.conf /etc/php/7.4/fpm/pool.d/
COPY /www.conf /etc/php/7.3/fpm/pool.d/
COPY wordpress_init.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/wordpress_init.sh
RUN mkdir -p /run/php/
ENTRYPOINT [ "/usr/local/bin/wordpress_init.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "-F"]

