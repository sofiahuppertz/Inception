# ALPINE PENULTIMATE STABLE VERSION IMAGE
FROM debian:bullseye

# After the FROM directive and before the first RUN that needs the nginx user
RUN addgroup --system nginx && adduser --system --no-create-home --ingroup nginx nginx

# INSTALL NGINX AND OPENSSL
RUN apt update && apt install -y \
  nginx \  
  openssl  

# The rest of your Dockerfile follows
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/svolodin.42.fr.key \
  -out /etc/nginx/ssl/svolodin.42.fr.crt \
  -subj "/C=FR/ST=Paris/L=Paris/O=42/CN=svolodin.42.fr"

# COPY NGINX CONFIGURATION FILE
RUN mkdir -p /etc/nginx
COPY conf/* /etc/nginx/.

# MAKE PORT 80 PUBLIC TO HOST
EXPOSE 80 443

# START NGINX
ENTRYPOINT ["nginx", "-g", "daemon off;"]