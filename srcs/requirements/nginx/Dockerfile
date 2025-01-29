FROM debian:buster

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom Nginx configuration file from the conf folder
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Expose ports for HTTP (80) and HTTPS (443)
EXPOSE 80 443

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
