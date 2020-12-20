# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## Docker: build docker image
	@docker build --force-rm --pull --tag joorem-dotfiles .

clean: ## Docker: delete docker image
	@docker image rm joorem-dotfiles

run: ## Docker: run docker image
	@docker run --rm --interactive --tty joorem-dotfiles zsh

docker: | build run ## Docker: build and run docker image

update: ## Update: Vim plugins, brew packages, Git submodules
	@echo "Updating:"
	@echo "  - Vim plugins"
	@vim -E -s -u ~/.vimrc +PlugUpdate +qall; /bin/echo -n
	@echo "  - brew packages"
	@brew upgrade
	@echo "  - git submodules"
	@git submodule update --rebase
