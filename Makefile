.PHONY: build run run-api login clean setup

build:
	docker compose build

run:
	docker compose run --rm claude

run-api:
	docker compose run --rm claude-api

login:
	docker compose run --rm claude login

clean:
	docker compose down --rmi local -v

setup:
	cp -n .env.example .env || true
	@echo ".env created. Set ANTHROPIC_API_KEY for 'make run-api'."
