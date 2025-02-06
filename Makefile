SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

create: ## Create Astro project and config ESLint
	npm create astro@latest
	npm init @eslint/config@latest

run-dev: ## Start Astro dev server
	npm run dev

check-eslint: ## Check project files with ESLint
	npx eslint ./*.js
	
update: ## Update dependencies
	npm update

upgrade-astro: ## Upgrade Astro and official integrations
	npx @astrojs/upgrade
	
build: ## Build site
	npm run build

preview: build ## Build and preview site
	npm run preview
