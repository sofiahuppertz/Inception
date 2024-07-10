#!/bin/bash
set -e

# Function to handle SIGTERM
graceful_shutdown() {
  echo "SIGTERM received, shutting down MariaDB..."
  mysqladmin shutdown -uroot -p"${MYSQL_ROOT_PASSWORD}"
  exit 0 # Exit gracefully
}

# Trap SIGTERM and call graceful_shutdown when it's received
trap graceful_shutdown SIGTERM

# Start MariaDB in the background for initial setup
mysqld_safe &

# Save the PID of the MariaDB process
MARIADB_PID=$!

sleep 10

# Run your SQL commands
mariadb -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_USER}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# Wait for the background MariaDB process to finish
wait $MARIADB_PID

# Start mysqld_safe as the final command to keep it running in the foreground
exec mysqld_safe