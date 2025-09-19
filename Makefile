.PHONY: help build up down logs clean test shell db-shell

# Default target
help: ## Show this help message
	@echo "Commands"
	@echo "==============================="
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build all Docker images
	docker-compose build

up: ## Start all services in development mode
	docker-compose up

up-d: ## Start all services in background (detached mode)
	docker-compose up -d

down: ## Stop all services
	docker-compose down

down-v: ## Stop all services and remove volumes (WARNING: Data loss)
	docker-compose down -v

logs: ## Show logs from all services
	docker-compose logs -f

restart: ## Restart all services
	docker-compose restart

node-shell: ## Access Node container shell
	docker-compose exec node bash

node-install: ## Install dependencies in Node container
	docker-compose run --rm node npm install

node-dev: ## Run dev server in Node container
	docker-compose run --rm node npm run dev

node-build: ## Build assets in Node container
	docker-compose run --rm node npm run build

clean: ## Clean up Docker system (remove unused containers, networks, images)
	docker system prune -f

clean-all: ## Clean up everything including volumes (WARNING: Data loss)
	docker system prune -a -f --volumes

status: ## Show status of all services
	docker-compose ps

setup: ## Initial setup - copy environment file
	@if [ ! -f .env ]; then \
		cp .env.example .env; \
		echo "✅ Created .env file"; \
	else \
		echo "⚠️  .env file already exists"; \
	fi