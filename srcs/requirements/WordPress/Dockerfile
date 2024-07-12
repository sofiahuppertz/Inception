FROM debian:bullseye

# Install necessary packages
RUN apt update && apt install -y \
    php-fpm \
    php-mysql \
    wget \
    tar \
    && rm -rf /var/lib/apt/lists/*


# PHP-FPM configuration
RUN mkdir /run/php
ADD conf/wordpress.conf /etc/php/7.4/fpm/pool.d/

# Copy the startup script
COPY tools/wordpress-setup.sh /tmp/wordpress-setup.sh
RUN chmod +x /tmp/wordpress-setup.sh


# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
ENTRYPOINT ["/tmp/wordpress-setup.sh"]

