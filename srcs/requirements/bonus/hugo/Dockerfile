FROM    alpine:3.15

WORKDIR /var/hugo/me

RUN     apk update && apk upgrade && apk add --update --no-cache \
            hugo \
            git \
            shadow \
 &&     rm -f /var/cache/apk/*
# create new hugo site
RUN hugo new site /var/hugo/me \
 	&&     cd /var/hugo/me \
 	&&     git clone https://github.com/vaga/hugo-theme-m10c themes/m10c \
 	&&     hugo -b https://mmarie.42.fr/me

COPY	./conf/config.toml	/var/hugo/me/config.toml
COPY	conf/avatar.png		/var/hugo/me/themes/m10c/static/avatar.png
COPY	./conf/style.css		/var/hugo/me/assets/css/style.css
COPY ./conf/baseof.html /var/hugo/me/layouts/_default/baseof.html
COPY ./conf/index.html /var/hugo/me/layouts/
RUN mkdir /var/hugo/me/layouts/taxonomy
COPY ./conf/taxonomy.html /var/hugo/me/layouts/taxonomy/taxonomy.html

EXPOSE 1313

CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://mmarie.42.fr/me", \
         "-p", "1313", \
         "--logFile=/dev/stdout", \
        "--appendPort=false"]
