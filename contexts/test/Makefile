-include ../prerequisites/tasks.mk

##>> run both unit and acceptance tests

.DEFAULT_GOAL := all
.PHONY: all unit acceptance

## all (default): run both unit and acceptance tests
all: unit acceptance

## unit: run all unit tests
## acceptance: run all funcional tests
unit acceptance:
	@$(MAKE) -C $(@)/
