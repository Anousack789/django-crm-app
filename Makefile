.DEFAULT_GOAL := help

.PHONY: help install runserver makemigrations migrate shell check test test-django test-browser collectstatic

help: ## Show available commands
	@awk 'BEGIN {FS = ":.*##"}; /^[a-zA-Z_-]+:.*##/ {printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Create the virtual environment and install dependencies
	uv venv
	uv pip install -r requirements.txt

runserver: ## Start the Django development server
	uv run python manage.py runserver

makemigrations: ## Create migrations for model changes
	uv run python manage.py makemigrations

migrate: ## Apply database migrations
	uv run python manage.py migrate

shell: ## Open the Django interactive shell
	uv run python manage.py shell

check: ## Validate the Django project configuration
	uv run python manage.py check

test: ## Run the full pytest test suite
	uv run pytest

test-django: ## Run Django's built-in test runner
	uv run python manage.py test

test-browser: ## Run browser tests with a visible browser
	uv run pytest core/tests/test_browser.py --headed

collectstatic: ## Collect static files for deployment
	uv run python manage.py collectstatic --noinput
