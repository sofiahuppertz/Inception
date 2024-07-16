COMPOSE_FILE = srcs/docker-compose.yml
ENV_FILE = srcs/.env

all: help

# Check if .env file exists
check-env:
	@if [ ! -f $(ENV_FILE) ]; then \
		printf "$(RED)$(REVERSED) Error: .env file not found in ./srcs directory. $(RESET)\n"; \
		exit 1; \
	fi

# Build services
build: check-env
	docker compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) build

# Start services
up: check-env
	docker compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up -d

# Stop services
down: check-env
	docker compose -f $(COMPOSE_FILE) down

# Restart services
restart: down up

# View logs
logs: check-env
	docker compose -f $(COMPOSE_FILE) logs -f

# List services status
ps: check-env
	docker compose -f $(COMPOSE_FILE) ps

# Remove services and volumes
clean: down
	docker compose -f $(COMPOSE_FILE) rm -v --force

# Remove services, volumes, and images
prune: clean
	docker system prune -a --volumes --force

# Help command to list all targets
help:
	@printf "$(GREEN)$(REVERSED) Available commands: $(RESET)\n"
	@printf "  $(ITALIC)$(BOLD)make build$(RESET)    $(YELLOW)- Build the Docker images.$(RESET)\n"
	@printf "  $(ITALIC)$(BOLD)make up$(RESET)       $(YELLOW)- Build and start the Docker containers.$(RESET)\n"
	@printf "  $(ITALIC)$(BOLD)make down$(RESET)     $(YELLOW)- Stop the running Docker containers.$(RESET)\n"
	@printf "  $(ITALIC)$(BOLD)make restart$(RESET)  $(YELLOW)- Restart the Docker containers.$(RESET)\n"
	@printf "  $(ITALIC)$(BOLD)make logs$(RESET)     $(YELLOW)- Follow the logs of the running Docker containers.$(RESET)\n"
	@printf "  $(ITALIC)$(BOLD)make ps$(RESET)       $(YELLOW)- List the status of the Docker containers.$(RESET)\n"
	@printf "  $(ITALIC)$(BOLD)make clean$(RESET)    $(YELLOW)- Stop and remove the Docker containers and their volumes.$(RESET)\n"
	@printf "  $(ITALIC)$(BOLD)make prune$(RESET)    $(YELLOW)- Remove all stopped containers, unused networks, dangling images, and unused volumes.$(RESET)\n"
	@printf "  $(ITALIC)$(BOLD)make help$(RESET)     $(YELLOW)- Show this help message.$(RESET)\n"

.PHONY: all check-env build up down restart logs ps clean prune help

# Colors
RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[0;33m
BLUE := \033[0;34m
MAGENTA := \033[0;35m
CYAN := \033[0;36m
WHITE := \033[0;37m
RESET := \033[0m
BOLD := \033[1m
UNDERLINE := \033[4m
REVERSED := \033[7m
ITALIC := \033[3m
