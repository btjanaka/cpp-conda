# Convenience commands / scripts.

help:
	@echo "\033[0;1mCommands\033[0m"
	@grep -E '^[.a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[34;1m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help

setup-clang-tools: ## Sets up compilation database for clang tools. Assumes a build has already been run.
	ln -s build/compile_commands.json
.PHONY: setup-clang-tools

lint: ## Runs clang-tidy on all source code.
	find src include -type f -regextype posix-extended -regex '.*\.(cpp|h)' -exec clang-tidy {} \;
.PHONY: lint
