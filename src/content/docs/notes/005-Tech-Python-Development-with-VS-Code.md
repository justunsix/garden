---
filetags: ":python:vscode:development:epubnote:"
id: 3fcd1ad0-27c5-427f-a2bd-13f42ede86e2
title: Python Development with VS Code
---

## VSCode Setup for Python Devs

Source:

- [Complete No-Nonsense VSCode Setup for Python Devs -
  ArjanCodes](https://youtu.be/PwGKhvqJCQM)
- [Python VS Code Example
  repository](https://github.com/ArjanCodes/examples/tree/main/2024/vscode_python)

### Prerequisities

- Virtual Env
  - Regular venv approach
  - Poetry
  - UV
- Formatter
  - Ruff
    - Options: Can be installed on OS, VS Code Extension or depency in
      project to ensure consistency with others
    - Configure with ruff.toml
- Secondary Langauages
  - TOML
    - e.g. support pyproject.toml, ruff.toml

### Extension Recommendations and related Language Supports

- Ruff
- Microsoft's Python Extensions
  - Python
    - Pylance that has Intellisense
  - Debugger
- Even Better TOML
  - TOML support
- .vscode folder to share with team to easily share settings and
  recommended extensions for project:
  - extensions.json
    - Other developers can install in VS Code

### Starting project and Structure

``` bash

# Create project folder, Use version control
mkdir my_project
cd my_project
touch .gitignore
# Use virtual environment/python project, example will use uv
uv init --no-workspace
# README, start py file
mkdir .vscode
touch settings.json
touch extensions.json
# Source code directory
mkdir src
mv hello.py src/main.py
cd src
# Package for importing
touch __init__.py
cd ..
# Unit tests
mkdir tests
touch tests_main.py

cd ..
# Dependencies
## uv will manage Dependencies in pyproject.toml
uv add --dev pytest

```

- Note for VS Codes different scopes in order of importance
  - User/profile settings
    - example:
      - window and sidebar locations, theme, font, UI
      - formatters, format on save, operations
  - Workspace settings (override user settings)
  - Folder settings (override workspace settings)
    - Example: project settings
      - Language: tests, environment files, diagnostics, binary like
        python venv directory

Set up pyproject.toml so tests know about src folder.

- See uv has added Dependencies
- pythonpath specifies list of modules for source
  - Allows tests in tests folder to import source in src folder as if it
    is in the src folder

``` toml

[project]
name = "vscode-python"
version = "0.1.0"
description = "Add your description here"
readme = "README.md"
requires-python = ">=3.12"
dependencies = [
    "pytest>=8.3.3",
]

[tool.pytest.ini_options]
pythonpath = "src"

```

- Project VS Code settings.json to set test and pylance LSP settings so
  it knows where to find src

``` json

{
    // Python settings
    "python.analysis.autoSearchPaths": true,
    "python.analysis.diagnosticSeverityOverrides": {
        "reportMissingImports": "none"
    },
    // Set so Pylance knows source for tests files
    // Add more folders for additional src directories
    "python.analysis.extraPaths": [
        "${workspaceFolder}/src"
    ],
    "python.envFile": "${workspaceFolder}/.env",
    "python.terminal.activateEnvironment": true,
    "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",
    // Test settings
    "python.testing.pytestEnabled": true,
    "python.testing.unittestEnabled": false,
    "python.testing.cwd": "${workspaceFolder}/tests",
    "python.testing.pytestPath": "${workspaceFolder}/.venv/bin/pytest",
    "python.testing.autoTestDiscoverOnSaveEnabled": true,
}

```

### More Extensions Recommendations

- GitHub Copilot - artificial intelligence help
- Better Comments - colouring coding
- GitHub Actions - CICD
- Markdown mermaid - diagrams in MD files
- Postman - for API testing
- SQLite - working with SQLite
- Dev Containers - open directories in containers
