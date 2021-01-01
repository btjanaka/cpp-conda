# Convenience commands / scripts.

help:
	@echo "\033[0;1mCommands\033[0m"
	@grep -E '^[.a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[34;1m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help

setup-clang-tools: ## Sets up compilation database for clang tools. Assumes a build has already been run.
	ln -s build/compile_commands.json
.PHONY: setup-clang-tools

SOURCE_FILES = $(shell find ./src ./include -type f -regextype posix-extended -regex '.*\.(cpp|h)')

lint: ## Run clang-tidy on all source files.
	clang-tidy $(SOURCE_FILES)
.PHONY: lint

format: ## Run clang-format on all source files and fix in-place.
	clang-format -i $(SOURCE_FILES)
.PHONY: format

check-format: ## Run scripts/check-format.sh on source files.
	@bash scripts/check-format.sh $(SOURCE_FILES)
.PHONY: check-format
