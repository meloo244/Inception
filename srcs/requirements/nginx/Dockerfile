# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmarie <mmarie@student.42perpignan.fr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/21 17:11:51 by mmarie            #+#    #+#              #
#    Updated: 2025/03/21 17:36:31 by mmarie           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM nginx:latest

# Vérifie que le dossier existe avant de copier
WORKDIR /usr/share/nginx/html

COPY html/ ./

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

