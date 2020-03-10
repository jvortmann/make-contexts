-include ../../../prerequisites/tasks.mk
-include ../../../prerequisites/ruby.mk
-include ../../../prerequisites/javascript.mk

##>> run unit tests for javascript

.DEFAULT_GOAL := all
.PHONY: all legacy

## all (default): run javascript unit tests
all: yarn
	@yarn test

## legacy: run legacy javascript unit tests (using teaspoon gem)
legacy: bundle
	@bundle exec rake teaspoon
