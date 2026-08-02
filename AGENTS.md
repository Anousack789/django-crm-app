# Repository Guidelines

## Project Structure & Module Organization

This is a Django 6 project managed with `uv`. The application entry point is
`src/manage.py`; project configuration, URL routing, and ASGI/WSGI entry
points live in `src/cfehome/`. Add domain apps under `src/` (for example,
`src/customers/`) and keep each app's models, views, URLs, templates, and tests
together. Place tests in `<app>/tests/`; browser tests belong in
`<app>/tests/test_browser.py`.

## Build, Test, and Development Commands

Run commands from the repository root:

- `make install` creates the local environment and installs runtime packages.
- `cd src && uv run python manage.py runserver` starts Django locally.
- `cd src && uv run python manage.py makemigrations && uv run python manage.py migrate` creates and applies database migrations.
- `cd src && uv run python manage.py check` validates Django configuration.
- `make test` runs the pytest suite; `cd src && uv run python manage.py test` runs Django's test runner.
- `pre-commit run --all-files` applies the repository's formatting and static checks.

Use `make help` to see the currently defined convenience targets. Some Django
targets assume `manage.py` is the working-directory entry point, so invoke them
from `src/` until those targets are updated.

## Coding Style & Naming Conventions

Use Python 3.14 and four-space indentation. Follow Django conventions:
`snake_case` for modules, functions, variables, and migration names;
`PascalCase` for classes and models; and descriptive plural app names such as
`customers`. Keep URL patterns in each app's `urls.py` and include them from
`cfehome/urls.py`. Pre-commit runs Black, Ruff (including fixes and formatting),
`django-upgrade`, and template formatting; run it before opening a PR.

## Testing Guidelines

Write pytest tests named `test_*.py` and functions named `test_<behavior>()`.
Cover new views, model behavior, URL routing, and migrations where relevant.
Use `pytest-django` for database-backed tests and `pytest-playwright` only for
critical browser flows. Run the focused test first, then `make test` before
submitting changes.

## Commit & Pull Request Guidelines

Use short, imperative, lowercase commit subjects, matching the existing
history: `add Makefile` or `add pre-commit configuration file`. Keep commits
focused. Pull requests should explain the user-visible change, note migrations
or configuration changes, link the relevant issue, and include screenshots for
UI changes. Confirm checks and tests pass before requesting review.

## Security & Configuration

Do not commit `.env` files, credentials, generated databases, or collected
static files. Keep environment-specific values outside source control and use
Django settings rather than hard-coded secrets.
