-include ../../prerequisites/tasks.mk

##>> run unit tests for all languages

.DEFAULT_GOAL := all
.PHONY: all elixir javascript ruby

## all (default): run unit tests for all know languages
all: elixir javascript ruby

## elixir: run all elixir unit tests
## javascript: run all javascript unit tests
## ruby: run all ruby unit tests
elixir javascript ruby:
	@$(MAKE) -C $(@)/
