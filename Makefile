.PHONY: build run run-api login shell clean setup

-include .env

VOLUME_FLAGS := $(shell \
	if [ -n "$(PROJECTS)" ]; then \
		echo "$(PROJECTS)" | tr ',' '\n' | while read -r p; do \
			printf -- '-v %s:/workspace/%s ' "$$p" "$$(basename $$p)"; \
		done; \
	elif [ -n "$(PROJECT)" ]; then \
		printf -- '-v %s:/workspace' "$(PROJECT)"; \
	else \
		printf -- '-v %s:/workspace' "./workspace"; \
	fi \
)

build:
	docker compose build

run:
	docker compose run --rm $(VOLUME_FLAGS) claude

run-api:
	docker compose run --rm $(VOLUME_FLAGS) claude-api

login:
	docker compose run --rm $(VOLUME_FLAGS) claude login

shell:
	docker compose run --rm $(VOLUME_FLAGS) --entrypoint bash claude

clean:
	docker compose down --rmi local -v

setup:
	cp -n .env.example .env || true
	@echo ".env created. Set ANTHROPIC_API_KEY for 'make run-api'."
