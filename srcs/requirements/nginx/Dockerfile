# ALPINE PENULTIMATE STABLE VERSION IMAGE
FROM alpine:3.19

# UPDATE; INSTALL NGINX; INSTALL OPENSSL;
RUN apk update && apk add nginx && apk add openssl

# CREATE A FOLDERS FOR SSL CERT

# GENERATE SSL CERT

# COPY NGINX CONFIGURATION FILE
RUN mkdir -p /etc/nginx
COPY conf/nginx.conf /etc/nginx/conf.nginx



# RUN NGINX