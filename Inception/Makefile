# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lmiguel- <lmiguel-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/08/04 16:04:38 by lmiguel-          #+#    #+#              #
#    Updated: 2025/08/06 15:08:09 by lmiguel-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up : 

	@docker compose -f ./src/docker-compose.yml up -d

build:
	@docker compose -f ./src/docker-compose.yml up --build

down :

	@docker compose -f ./src/docker-compose.yml down

stop :

	@docker compose -f ./src/docker-compose.yml stop

start :

	@docker compose -f ./src/docker-compose.yml start

status :

	@docker ps

clean:

	@docker system prune -a --volumes


logs maria:

	@docker logs mariadb

logs nginx:

	@docker logs nginx

logs wordpress:

	@docker logs wordpress