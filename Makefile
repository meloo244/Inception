all:
	@docker compose -f srcs/docker-compose.yml  up -d --build

stop:
	@docker compose -f srcs/docker-compose.yml  down

start:
	@docker compose -f srcs/docker-compose.yml  up -d --build

delete:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker ne
	twork rm $$(docker network ls -q);\

prune:
	@docker system prune -a
	docker system prune --volumes

restart:
	@docker compose -f srcs/docker-compose.yml restart

.PHONY: all re down clean docker_restart

docker_rl:
	@docker stop $$(docker ps -qa);
	@echo "Redémarrage de Docker Desktop (MacOS uniquement)..."
	@echo "Pruning Docker Delete volumes..."
	@docker compose -f srcs/docker-compose.yml  down
	@docker system prune -a
	@docker system prune --volumes
	@rm -rf volume/mariadb/*
	@rm -rf volume/wordpress/*
	@sleep 3
	@killall "Docker Desktop" || true
	@sleep 10
	@open -a "Docker Desktop"
	@echo "Docker Desktop redémarré avec succès"
	@echo "Lancement des conteneur attendez 10seconde"
	@sleep 10
	@docker compose -f srcs/docker-compose.yml  up -d --build
	@open -a "Windsurf"
open:
	@open -a "Docker Desktop"
close:
	@killall "Docker Desktop" || true
