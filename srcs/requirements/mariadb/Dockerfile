# Use debian:buster as the base image
FROM debian:buster

# Update and install MariaDB
RUN apt-get update -y && apt-get install mariadb-server -y

# Copy the configuration and the script
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /

# Ensure the script is executable
RUN chmod +x /script.sh

# Set the script as the entrypoint
ENTRYPOINT ["/script.sh"]
