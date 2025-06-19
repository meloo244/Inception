FROM    alpine:3.15

WORKDIR /var/hugo/me  # Répertoire principal du projet Hugo

RUN     apk update && apk upgrade && apk add --update --no-cache \
            hugo \
            git \
            shadow \
 &&     rm -f /var/cache/apk/*

# Créer un nouveau site Hugo
RUN hugo new site /var/hugo/me \
 	&& cd /var/hugo/me \
 	&& git clone https://github.com/vaga/hugo-theme-m10c themes/m10c \
 	&& hugo new posts/presentation.md \
 	&& hugo -b ******.42.fr/static \
	&& mkdir -p /var/hugo/me/content/about

# Copier le fichier de configuration
COPY	./conf/config.toml		/var/hugo/me/config.toml

# Créer le répertoire `static/css` et copier le fichier CSS
RUN		mkdir -p /var/hugo/me/static/css
COPY	./conf/style.css		/var/hugo/me/static/css/style.css
COPY	./conf/style.css		/var/hugo/me/style.css
RUN mkdir /var/hugo/me/layouts/taxonomy
COPY ./conf/taxonomy.html /var/hugo/me/layouts/taxonomy/taxonomy.html


EXPOSE 1313

CMD ["hugo", "server", "--source=/var/hugo/me", "--bind=0.0.0.0", "--baseURL=https://******.42.fr/static", "-p", "1313", "--logFile=/dev/stdout", "--appendPort=false"]

