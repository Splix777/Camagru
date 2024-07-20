# Variables
DOCKER_COMPOSE = docker compose

# Default target
.DEFAULT_GOAL := help

.PHONY: help
help: ## Display this help message
	@echo "Usage:"
	@echo "  make [target]"
	@echo ""
	@echo "Targets:"
	@awk 'BEGIN {FS = ":.*##"; printf "  %-20s %s\n", "Target", "Description"; printf "  %-20s %s\n", "------", "-----------";} /^[a-zA-Z_-]+:.*?##/ { printf "  %-20s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

.PHONY: up
up: ## Start the Docker containers
	$(DOCKER_COMPOSE) up --build

.PHONY: down
down: ## Stop the Docker containers
	$(DOCKER_COMPOSE) down

.PHONY: start
start: ## Start the Docker containers without rebuilding
	$(DOCKER_COMPOSE) start

.PHONY: stop
stop: ## Stop the Docker containers without removing them
	$(DOCKER_COMPOSE) stop

.PHONY: clean
clean: ## Stop and remove containers, networks, images, and volumes
	$(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans

.PHONY: fclean
fclean: clean ## Alias for clean

.PHONY: re
re: clean up ## Rebuild the Docker containers

.PHONY: prune
prune: ## Prune all unused Docker objects
	docker system prune -a --volumes --force

.PHONY: status
status: ## Show Docker status for containers, volumes, images, and networks
	@echo "Containers:"
	docker ps
	@echo ""
	@echo "Volumes:"
	docker volume ls
	@echo ""
	@echo "Images:"
	docker images
	@echo ""
	@echo "Networks:"
	docker network ls
