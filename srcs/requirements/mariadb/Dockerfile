FROM	debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

EXPOSE 3306

#COPY		./conf/mysqld.conf ~/my.cnf
COPY		./conf/mysql.conf /etc/mysql/my.cnf
#COPY		./conf/mysqld.conf /etc/my.cnf


COPY ./tools/setup_mariadb.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/setup_mariadb.sh
RUN chmod +x /usr/local/bin/wordpress.sql

ENTRYPOINT [ "/usr/local/bin/setup_mariadb.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]
