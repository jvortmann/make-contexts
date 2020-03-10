-include ../prerequisites/tasks.mk

##>> run lint for all languages

.DEFAULT_GOAL := all
.PHONY: all elixir javascript ruby

## all (default): run lint for all know languages
all: elixir javascript ruby

## elixir: run elixir lint
## javascript: run javascript lint
## ruby: run ruby lint
elixir javascript ruby:
	@$(MAKE) -C $(@)/
