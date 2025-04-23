#!/bin/bash

# Spécifier la version de WordPress à télécharger
WP_VERSION="6.7.2-fr_FR"

# Vérifier si WordPress est déjà installé en vérifiant la présence du fichier wp-config.php
if [ -f /var/www/html/wp-config.php ]; then
	echo "WordPress is already installed (wp-config.php present). Nothing to do."
else

# Télécharger WordPress si le fichier wp-config.php n'existe pas
echo "Downloading WordPress version Latest version in FR..."
curl -O https://fr.wordpress.org/latest-fr_FR.zip

# Extraire les fichiers de WordPress
unzip latest-fr_FR.zip

# Déplacer les fichiers extraits dans le répertoire actuel (si nécessaire)
mv wordpress/* .

# Supprimer le répertoire vide 'wordpress' et l'archive zip
rm -rf wordpress latest-fr_FR.zip

echo "MYSQL_USER=$MYSQL_USER"
echo "MYSQL_PASSWORD=$MYSQL_PASSWORD"
echo "MYSQL_HOSTNAME=$MYSQL_HOSTNAME"
echo "MYSQL_DATABASE=$MYSQL_DATABASE"
# Afficher les variables d'environnement pour le débogage

# Remplacer les placeholders dans le wp-config-sample.php
sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

##bonus

wp config set WP_REDIS_HOST $REDIS_HOST --allow-root
wp config set WP_REDIS_PORT $REDIS_PORT --raw --allow-root
wp config set WP_CACHE_KEY_SALT $REDIS_CACHE --allow-root
#wp config set WP_REDIS_PASSWORD $REDIS_PASSWORD --allow-root
wp config set WP_REDIS_CLIENT $REDIS_CLIENT --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root
wp redis enable --allow-root

#Change password for the user mmarie and Update DB
wp db update --allow-root
wp user update mmarie --user_pass=$WP_USERPASSWORD --allow-root

fi

exec "$@"
