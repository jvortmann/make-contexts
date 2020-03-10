-include ../../prerequisites/tasks.mk
-include ../../prerequisites/elixir.mk

##>> run lint for elixir

.DEFAULT_GOAL := all
.PHONY: all

## all (default): run lint for elixir files
all: mix
	@mix credo
