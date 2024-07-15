#!/bin/sh

mysqld_safe &

until mysqladmin ping >/dev/null 2>&1; do
  echo "Waiting for database connection..."
  sleep 5
done

# mysql root exec
SQL_CMD="mysql -u root -p${MYSQL_ROOT_PASSWORD} -e"

$SQL_CMD "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"
$SQL_CMD "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
$SQL_CMD "GRANT ALL PRIVILEGES ON \`${MYSQL_DB}\`.* TO \`${MYSQL_USER}\`@'%';"
$SQL_CMD "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
$SQL_CMD "FLUSH PRIVILEGES;"

mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

exec mysqld_safe