SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

create: ## Create Astro project and config ESLint
	npm init --yes
	npm install astro
	npm init @eslint/config@latest

install: ## Install all dependencies
	pnpm install

run-dev: build ## Build and run Astro development site
	pnpm run dev

check-eslint: ## Check project files with ESLint
	pnpm dlx eslint ./*.js

check-astro: ## Running type checking and diagnostics in Astro projects
	pnpm dlx astro check
	
update: ## Update dependencies
	pnpm update

upgrade-astro: ## Upgrade Astro and official integrations
	npx @astrojs/upgrade

build: ## Build site
	pnpm build

run-preview: build ## Build and preview site
	pnpm preview
