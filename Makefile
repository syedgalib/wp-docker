.PHONY: help build up down logs clean test shell db-shell

# Default target
help: ## Show this help message
	@echo "Commands"
	@echo "==============================="
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build all services
	docker-compose build

up: ## Start all services in development mode
	docker-compose up

up-d: ## Start all services in background (detached mode)
	docker-compose up -d

app-shell: ## Access app container shell
	docker-compose exec app bash

down: ## Stop all services
	docker-compose down

down-v: ## Stop all services and remove volumes (WARNING: Data loss)
	docker-compose down -v

logs: ## Show logs from all services
	docker-compose logs -f

restart: ## Restart all services
	docker-compose restart

status: ## Show status of all services
	docker-compose ps

env: ## Create .env file
	@if [ ! -f .env ]; then \
		cp .env.example .env; \
		echo "✅ Created .env file"; \
	else \
		echo "⚠️  .env file already exists"; \
	fi

wp-config: ## Create wp-config.php file
	@if [ ! -f public/wp-config.php ]; then \
		cp public/wp-config-docker.php public/wp-config.php; \
		echo "✅ Created wp-config.php file"; \
	else \
		echo "⚠️  wp-config.php file already exists"; \
	fi