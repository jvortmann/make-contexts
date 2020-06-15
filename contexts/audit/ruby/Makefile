-include ../../prerequisites/tasks.mk
-include ../../prerequisites/ruby.mk

##>> run audit for ruby

.DEFAULT_GOAL := all
.PHONY: all

IGNORE_FILE := $(base_path)/.bundler-audit.ignore

ifneq (,$(wildcard $(IGNORE_FILE)))
	IGNORE_ARG := --ignore $(shell cat $(IGNORE_FILE))
endif

## all (default): run audit for ruby
all: bundle
	@cd $(base_path) && bundle exec bundle audit --update $(IGNORE_ARG)
