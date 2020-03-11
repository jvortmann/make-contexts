-include ../../../prerequisites/tasks.mk
-include ../../../prerequisites/elixir.mk

##>> run unit tests for elixir

.DEFAULT_GOAL := all
.PHONY: all

## all (default): run elixir unit tests
all: mix
	@cd $(basepath) && mix test
