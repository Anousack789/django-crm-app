# Django CRM App

## Development setup

Install the project dependencies, including development tools:

```bash
uv sync --all-groups
```

Enable the Git pre-commit hook:

```bash
uv run pre-commit install
```

Without this installation, `git commit` does not run the checks in
`.pre-commit-config.yaml`. Confirm the setup, or run all checks manually, with:

```bash
uv run pre-commit run --all-files
```
