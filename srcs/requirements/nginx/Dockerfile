# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmarie <mmarie@student.42perpignan.fr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/21 17:11:51 by ******            #+#    #+#              #
#    Updated: 2025/06/19 18:33:52 by mmarie           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN apt-get update
RUN apt-get update && apt-get install -y nginx openssl

# Generate Certificate SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 42 -nodes \
	-out /etc/nginx/ssl/******.crt \
	-keyout /etc/nginx/ssl/******.key \
	-subj "/C=FR/ST=Perpignan/L=Perpignan/O=42/OU=******/CN=******.42.fr/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN rm -rf /etc/nginx/conf.d/default.conf

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
