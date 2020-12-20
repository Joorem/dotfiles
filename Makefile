# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## Build docker image
	@docker build --force-rm --pull --tag joorem-dotfiles .

clean: ## Delete docker image
	@docker image rm joorem-dotfiles

run: ## Run docker image
	@docker run --rm --interactive --tty joorem-dotfiles zsh

docker: | build run ## Build and run docker image
