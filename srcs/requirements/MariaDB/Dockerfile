FROM debian:bullseye

# Install MariaDB
RUN apt update && apt install -y \
  tini \
  mariadb-server 

RUN mkdir -p /etc/mysql
COPY conf/my.cnf /etc/my.cnf

COPY tools/mariadb-setup.sh /mariadb-setup.sh
RUN chmod +x /mariadb-setup.sh

# Start tini to remove zombie processes
ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["./mariadb-setup.sh"]

