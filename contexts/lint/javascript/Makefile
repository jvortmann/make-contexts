-include ../../prerequisites/tasks.mk
-include ../../prerequisites/javascript.mk

##>> run lint for javascript

.DEFAULT_GOAL := all
.PHONY: all

## all (default): run lint for javascript files
all: yarn
	@cd $(base_path) yarn lint
