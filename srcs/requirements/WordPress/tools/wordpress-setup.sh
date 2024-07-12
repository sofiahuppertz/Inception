#!/bin/sh

# Set the WordPress path as a global variable
WP_PATH=/var/www/html

# Check if wp-config.php exists
if [ -f $WP_PATH/wp-config.php ]; then
    echo "WordPress already downloaded"
else
    # Download WordPress and all config files
    wget http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    mkdir -p /var/www/html/
    mv wordpress/* $WP_PATH/.
    chown -R www-data:www-data /var/www/html/
    chmod -R 755 /var/www/html/
    rm -rf latest.tar.gz wordpress

    # Import env variables in the config file
    sed -i "s/username_here/$MYSQL_USER/g" $WP_PATH/wp-config-sample.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" $WP_PATH/wp-config-sample.php
    sed -i "s/localhost/$MYSQL_HOSTNAME/g" $WP_PATH/wp-config-sample.php
    sed -i "s/database_name_here/$MYSQL_DB/g" $WP_PATH/wp-config-sample.php
    cp $WP_PATH/wp-config-sample.php $WP_PATH/wp-config.php
fi

exec php-fpm7.4 --nodaemonize
