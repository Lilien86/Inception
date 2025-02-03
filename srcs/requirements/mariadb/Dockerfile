FROM debian:buster

RUN apt-get update -y && apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY conf/setup.sh /usr/local/bin

RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["setup.sh"]

EXPOSE	3306

CMD	 ["mysqld"]