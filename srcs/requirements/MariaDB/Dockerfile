FROM debian:bullseye

# Set environment variables
ENV MYSQL_USER=shuppert \
  MYSQL_PASSWORD=1234 \
  MYSQL_DB=wordpress \
  MYSQL_ROOT_PASSWORD=root_1234

# Install MariaDB server
RUN apt update && apt install -y mariadb-server

# Expose port 3306
EXPOSE 3306

# Copy configuration files and scripts
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /tools/entrypoint.sh /usr/local/bin/entrypoint.sh

# Set permissions
RUN chmod +x /usr/local/bin/entrypoint.sh

# Use the custom script as the entrypoint
ENTRYPOINT ["entrypoint.sh"]


