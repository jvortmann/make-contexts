-include ../prerequisites/tasks.mk

##>> todo list

.DEFAULT_GOAL := search
.PHONY: search all todo important warning note hack

todo_pattern = "TODO"
important_pattern = "IMPORTANT"
warning_pattern = "WARNING"
note_pattern = "NOTE"
hack_pattern = "HACK"
fix_pattern = "FIX"
all_pattern = "[A-Z]+"
type := all

blue := \033[34m
bold := \033[37m
cyan := \033[36m
green := \033[32m
orange := \033[91m
purple := \033[95m
red := \033[31m
reset := \033[0m
yellow := \033[33m

define clean_filter_todos
	rg "# $(1):.*$$" --color never --no-heading -o -n --column
endef

define filter_todos
	$(call clean_filter_todos,$(1)) | sed -E 's/(.*):(.*):(.*):# ([[:upper:]]+): (.*)$$/\4 \1 \2 \3 "\5"/' | xargs -L1 printf "$(2)%-10s $(blue)%-s $(yellow)%3d:%-3d $(reset)%s\n" | sort
endef

## search: search any TODO-like than can be found
search:
	@cd $(base_path) && $(call filter_todos,$(all_pattern),$(bold)) || echo " NONE"

## all: list all
all: important warning fix todo note hack

quickfix: rg
	@cd $(base_path) && $(call clean_filter_todos,$($(type)_pattern)) || echo " NONE"

## todo: list all TODO
todo: rg
	@cd $(base_path) && $(call filter_todos,$(todo_pattern),$(cyan)) || echo " NONE"

## important: list all IMPORTANT
important: rg
	@cd $(base_path) && $(call filter_todos,$(important_pattern),$(red)) || echo " NONE"

## warning: list all WARNING
warning: rg
	@cd $(base_path) && $(call filter_todos,$(warning_pattern),$(yellow)) || echo " NONE"

## note: list all NOTE
note: rg
	@cd $(base_path) && $(call filter_todos,$(note_pattern),$(green)) || echo " NONE"

## hack: list all HACK
hack: rg
	@cd $(base_path) && $(call filter_todos,$(hack_pattern),$(purple)) || echo " NONE"

## fix: list all FIX
fix: rg
	@cd $(base_path) && $(call filter_todos,$(fix_pattern),$(orange)) || echo " NONE"

.PHONY:
rg:
ifeq ($(shell uname -s),Darwin)
	@command -v rg 1> /dev/null || (echo "Installing ripgrep for MacOS" && brew install ripgrep)
else
	@command -v rg 1> /dev/null || (echo "Installing ripgrep for Linux"; apt-get install ripgrep)
endif
