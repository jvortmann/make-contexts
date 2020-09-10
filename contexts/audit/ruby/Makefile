-include ../../prerequisites/tasks.mk
-include ../../prerequisites/ruby.mk

##>> run audit for ruby

.DEFAULT_GOAL := all
.PHONY: all

IGNORE_FILE := $(base_path)/.bundler-audit.ignore
IGNORES := $(shell cut -d"\#" -f1 $(IGNORE_FILE))

ifneq ($(strip $(IGNORES)),)
	IGNORE_ARG := --ignore $(IGNORES)
endif

## all (default): run audit for ruby
all: bundle
	@cd $(base_path) && bundle exec bundle audit --update $(IGNORE_ARG)
