service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS '$(MYSQL_DB)';"
mysql -e "CREATE USER IF NOT EXISTS '$(MYSQL_USER)'@'%' IDENTIFIED BY '$(MYSQL_PASSWORD)';"
mysql -e "GRANT ALL PRIVILEGES ON $(MYSQL_DB).* TO '$(MYSQL_USER)'@'%';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(MYSQL_ROOT_PASSWORD)';"


