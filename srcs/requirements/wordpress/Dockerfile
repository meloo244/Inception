FROM	debian:buster

# dependence
RUN apt-get update && apt-get -y install \
		wget \
		curl \
		bash \
		php \
		php-cgi \
		php-mysql \
		php-fpm \
		php-pdo \
		php-gd php-cli \
		php-mbstring \
		redis \
		php-redis \
		&& rm -rf /var/lib/apt/lists/*

#Dl wp-cli & Change perm
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/wp-config.php /var/www/html/wp-config.php
COPY ./tools/change_user.sh /usr/local/bin/

#Enable php
RUN mkdir /run/php

# copy the shell script give the rule
COPY ./tools/setup_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup_wp.sh
ENTRYPOINT ["/usr/local/bin/setup_wp.sh"]

WORKDIR /var/www/html/
EXPOSE 9000
# Start FPM CGI
CMD ["/usr/sbin/php-fpm7.3", "-F"]
