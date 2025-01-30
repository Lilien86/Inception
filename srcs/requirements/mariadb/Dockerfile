FROM debian:buster

# Set maintainer
LABEL maintainer="your-email@example.com"

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    mariadb-server \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables (use .env file to manage these in your project)
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

# Copy initialization script for MariaDB
COPY conf/init.sql /docker-entrypoint-initdb.d/
COPY conf/my.cnf /etc/mysql/my.cnf

# Expose port 3306
EXPOSE 3306

# Run MariaDB service
CMD ["mysqld"]
