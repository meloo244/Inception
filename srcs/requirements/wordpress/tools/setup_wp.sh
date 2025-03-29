#!/bin/bash

# Spécifier la version de WordPress a télécharger
WP_VERSION="6.7.2-fr_FR"

# Vérifier si WordPress est déjà installé en vérifiant la présence du fichier wp-config.php
if [ -f ./wp-config.php ]; then
    echo "WordPress is already downloaded"
	echo "new wp"
	cp wp-config.php /var/www/html/wp-config.php
else
    # Télécharger WordPress si le fichier wp-config.php n'existe pas
    echo "Downloading WordPress version $WP_VERSION..."
    curl -O https://fr.wordpress.org/wordpress-$WP_VERSION.tar.gz

    # Extraire les fichiers de WordPress
    tar xfz wordpress-$WP_VERSION.tar.gz

    # Supprimer l'archive téléchargée pour garder l'image propre
    rm -rf wordpress-$WP_VERSION.tar.gz

    # Déplacer les fichiers extraits dans le répertoire actuel (si nécessaire)
    mv wordpress/* .

    # Supprimer le répertoire vide 'wordpress'
    rm -rf wordpress

echo "MYSQL_USER=$MYSQL_USER"
echo "MYSQL_PASSWORD=$MYSQL_PASSWORD"
echo "MYSQL_HOSTNAME=$MYSQL_HOSTNAME"
echo "MYSQL_DATABASE=$MYSQL_DATABASE"
# Afficher les variables d'environnement pour le débogage

#Sed est un Outil tres puissant qui permet de faire de la gestion de fichier et remplace ce qu'il
sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
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

	#Change password for the user mmarie and Update DB
	wp db update --allow-root
	wp user update mmarie --user_pass="admin" --allow-root

fi
exec "$@"
