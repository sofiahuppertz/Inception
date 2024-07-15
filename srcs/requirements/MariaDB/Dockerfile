FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt install -y mariadb-server

RUN mkdir -p /run/mysqld /var/lib/mysql /var/log/mariadb && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql /var/log/mariadb

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb-setup.sh /mariadb-setup.sh

RUN chmod +x /mariadb-setup.sh

ENTRYPOINT ["sh", "/mariadb-setup.sh"]
