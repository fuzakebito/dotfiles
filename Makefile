.DEFAULT_GOAL := help
MAKEFLAGS += --always-make
MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
DOTFILES_DIR := $(dir $(MAKEFILE_PATH))

# INFO: 参考サイト - https://postd.cc/auto-documented-makefile/
help: ## subcommand list and description.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

deno-install: ## Install deno
	@curl -fsSL https://deno.land/install.sh | sh

mise-install: ## Install mise
	@curl https://mise.jdx.dev/install.sh | sh

paru-install: ## Install paru
	@git clone https://aur.archlinux.org/paru-bin.git && \
	cd paru-bin && \
	makepkg -si && \
	cd ../ && \
	rm -rf paru-bin

ln: ## expand config files.
	@ln -snvf $(DOTFILES_DIR)home/.??* $(HOME)/
	@mkdir -p .local/bin
	@ln -snvf $(DOTFILES_DIR)bin/* $(HOME)/.local/bin/
	@mkdir -p .config
	@ln -snvf $(DOTFILES_DIR)config/* $(HOME)/.config/
	@ln -snvf $(HOME)/.config/zsh/.zshrc $(HOME)/.zshrc

init: ## install dotfiles and dependencies
	@make deno-install
	@make mise-install
	@make ln

dir:
	echo $(MAKEFILE_PATH)
	echo $(DOTFILES_DIR)
	echo $(HOME)
