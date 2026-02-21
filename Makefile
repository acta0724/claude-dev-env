.PHONY: build run login clean setup

build:
	docker compose build

run:
	docker compose run --rm claude

login:
	docker compose run --rm claude login

clean:
	docker compose down --rmi local -v

setup:
	cp -n .env.example .env || true
	@echo ".env created. Set ANTHROPIC_API_KEY or run 'make login' for Claude Max."
