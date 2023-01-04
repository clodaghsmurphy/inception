FROM debian:buster
EXPOSE 3306
RUN apt update && apt install mariadb-server mariadb-client -y

COPY ./tools/mariadb_init.sh /usr/local/bin
COPY ./conf/wordpress_db.sql /usr/local/bin


RUN chmod +x /usr/local/bin/mariadb_init.sh
RUN mkdir -p /var/run/mysql/ && \
    rm -rf /var/lib/apt/lists/* &&\
    chown -R mysql:mysql /var/run/mysql

ENTRYPOINT ["sh", "/usr/local/bin/mariadb_init.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0", "--log-error=/var/lib/mysql/error.log"]
