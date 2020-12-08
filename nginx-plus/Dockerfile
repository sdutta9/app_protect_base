# For Ubuntu 18.04:
FROM ubuntu:bionic

LABEL maintainer="sh.dutta@f5.com"

# Download certificate and key from the customer portal (https://cs.nginx.com)
# and copy to the build context:
COPY etc/ssl/nginx/nginx-repo.* /etc/ssl/nginx/
RUN chmod 644 /etc/ssl/nginx/* 

# Install prerequisite packages:
RUN apt-get update && apt-get install -y apt-transport-https lsb-release ca-certificates wget gnupg2 \
# Install nano
&& apt-get install -y nano

# Download and add the NGINX signing key:
RUN wget https://cs.nginx.com/static/keys/nginx_signing.key && apt-key add nginx_signing.key

# Add NGINX Plus repository:
RUN printf "deb https://plus-pkgs.nginx.com/ubuntu `lsb_release -cs` nginx-plus\n" | tee /etc/apt/sources.list.d/nginx-plus.list

# Download the apt configuration to `/etc/apt/apt.conf.d`:
RUN wget -P /etc/apt/apt.conf.d https://cs.nginx.com/static/files/90nginx

# Update the repository and install the most recent version of the NGINX Plus App Protect package (which includes NGINX Plus):
RUN apt-get update && apt-get install -y app-protect

# Remove nginx repository key/cert from docker
RUN rm -rf /etc/ssl/nginx

# Forward request logs to Docker log collector:
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# COPY /etc/nginx (Nginx configuration) directory
COPY etc/nginx /etc/nginx

# COPY entrypoint.sh file:
COPY entrypoint.sh /root/

CMD ["sh", "/root/entrypoint.sh"]