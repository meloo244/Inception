# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmarie <mmarie@student.42perpignan.fr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/21 17:11:51 by mmarie            #+#    #+#              #
#    Updated: 2025/03/21 19:42:47 by mmarie           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN apt-get update
RUN apt-get install -y nginx \
	openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 42 -nodes \
	-out /etc/nginx/ssl/mmarie.crt \
	-keyout /etc/nginx/ssl/mmarie.key \
	-subj "/C=FR/ST=Paris/L=Paris/0=42/OU=mmarie/CN=mmarie.42.fr/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "deamon off;"]
