.PHONY: build run clean setup

build:
	docker compose build

run:
	docker compose run --rm claude

clean:
	docker compose down --rmi local -v

setup:
	cp -n .env.example .env || true
	@echo ".env created. Set your ANTHROPIC_API_KEY."
