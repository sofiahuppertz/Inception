FROM debian:bullseye

RUN apt update
RUN apt install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN service mariadb start && mariadb < /var/www/mariadb_config.sql && rm -f /var/www/mariadb_config.sql;

CMD ["mysqld"]
