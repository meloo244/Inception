

echo $MYSQL_USER
echo $MYSQL_PASSWORD
echo $MYSQL_HOSTNAME
echo $MYSQL_DATABASE

Sed est un outil puissant pour manipuler et modifier des fichiers en remplaçant précisément les éléments nécessaires.
sed -i "s/mmarie/$MYSQL_USER/g" wp-config-sample.php
sed -i "s/mmarie_pwd42/$MYSQL_PASSWORD/g" wp-config-sample.php
sed -i "s/mariadb/$MYSQL_HOSTNAME/g" wp-config-sample.php
sed -i "s/wordpress/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

##bonus

	wp config set WP_REDIS_HOST redis --allow-root
  	wp config set WP_REDIS_PORT 6379 --raw --allow-root
 	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
  	#wp config set WP_REDIS_PASSWORD $REDIS_PASSWORD --allow-root
 	wp config set WP_REDIS_CLIENT phpredis --allow-root
	wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
	wp redis enable --allow-root

fi
exec "$@"
