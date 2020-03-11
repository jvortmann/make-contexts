-include ../../../prerequisites/tasks.mk
-include ../../../prerequisites/ruby.mk
-include ../../../prerequisites/javascript.mk

##>> run unit tests for javascript

.DEFAULT_GOAL := all
.PHONY: all legacy

## all (default): run javascript unit tests
all: yarn
	@cd $(base_path) && yarn test

## legacy: run legacy javascript unit tests (using teaspoon gem)
legacy: bundle
	@cd $(base_path) && bundle exec rake teaspoon
