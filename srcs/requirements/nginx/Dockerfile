# ALPINE PENULTIMATE STABLE VERSION IMAGE
FROM alpine:3.19

# UPDATE; INSTALL NGINX;
RUN apk update && apk add nginx && apk add vim && apk add openssl

# COPY NGINX CONFIGURATION FILE
RUN mkdir -p /etc/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# CREATE FOLDER FOR SSL CERTIFICATES
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/shuppert.42.fr.key -out /etc/nginx/ssl/shuppert.42.fr.crt \
-subj "/C=FR/ST=Paris/L=Paris/O=42/CN=shuppert.42.fr"

# CREATE FOLDER FOR WEBSITE
RUN mkdir -p home/www/html/
ADD tools/index.html /home/www/html

# MAKE PORT 80 PUBLIC TO HOST
EXPOSE 80 443

# START NGINX
CMD ["nginx", "-g", "daemon off;"]
