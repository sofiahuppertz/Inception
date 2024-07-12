FROM debian:bullseye

# Install MariaDB server
RUN apt update && apt install -y mariadb-server

# Expose port 3306
EXPOSE 3306

# Copy configuration files and scripts
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /tools/db-setup.sql /tmp/db-setup.sql

RUN sed -i -e "s/\${MYSQL_DB}/$MYSQL_DB/g" \
  -e "s/\${MYSQL_USER}/$MYSQL_USER/g" \
  -e "s/\${MYSQL_PASSWORD}/$MYSQL_PASSWORD/g" \
  -e "s/\${MYSQL_ROOT_PASSWORD}/$MYSQL_ROOT_PASSWORD/g" \
  /tmp/db-setup.sql

RUN service mariadb start && mysql < /tmp/db-setup.sql;

ENTRYPOINT ["mysqld"]



