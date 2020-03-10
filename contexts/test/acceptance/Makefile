-include ../../prerequisites/tasks.mk
-include ../../prerequisites/ruby.mk
-include ../../prerequisites/javascript.mk

##>> run acceptance tests

.DEFAULT_GOAL := all
.PHONY: all acceptance

export RAILS_ENV=test
export EAGER_LOAD_ON_BOOT=true

## all (default): run all funcional tests
all: acceptance

## acceptance: run all funcional tests
acceptance: bundle yarn
	./test_acceptance
