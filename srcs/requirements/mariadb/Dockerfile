FROM debian:bullseye

# Install MariaDB Server
RUN apt-get update && apt-get install -y mariadb-server

# Create the runtime directory for mysqld and adjust ownership
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# Copy custom server configuration (ensure your conf file meets project guidelines)
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy our initialization script into the image
COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/setup.sh" ]
