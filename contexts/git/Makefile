-include ../prerequisites/tasks.mk

##>> check last git changes, create tags, tag annotations...

.DEFAULT_GOAL := help
.PHONY: head last_tag interval create_tag changes features fixes docs chore refactor test improvements annotation

head := $(shell git log --pretty=format:"%h" HEAD -1)
last_tag := $(shell git describe --tags $(git rev-list --tags --skip=1 --max-count=1) | cut -f1 -d-)
interval := $(last_tag)..$(head)
changes_file := $(abspath /tmp/$(interval))
annotation_file := $(abspath $(changes_file).annotation)

feature_pattern = "(feature|feat):"
fix_pattern = "fix:"
doc_pattern = "doc:"
chore_pattern = "chore:"
refactor_pattern = "refactor:"
test_pattern = "test:"
improvements_pattern = "$(chore_pattern)|$(refactor_pattern)"

ERROR_EMPTY_TAG = $(error "Invalid Tag: '$(tag)'")

filter_commit = grep -E $(1) $(2)
format_commit = $(call filter_commit,$(1),$(2)) | cut -f2 -d: | sed -e "s/^/ -/"
print_commits = echo $(1) >> $(4) && $(call format_commit,$(2),$(3)) >> $(4) && echo >> $(4)

## head: show HEAD commit
head:
	@echo $(head)

## last_tag: show last tag
last_tag:
	@echo $(last_tag)

## interval: show interval of changes
interval:
	@echo $(interval)

$(changes_file):
	@git log --pretty=format:"%s" $(interval) > $(changes_file)

## create_tag: create a tag from param 'tag=' and open editor with annotation of last changes
create_tag: $(annotation_file)
	$(if $(strip $(tag)),,$(ERROR_EMPTY_TAG))
	@git tag $(tag) -e --file=$(annotation_file)

## changes: show changes from last tag to current HEAD
changes: $(changes_file)
	@echo "Showing changes between $(interval):"
	@echo
	@cat $(changes_file)

## features: show feature changes
features: $(changes_file)
	@$(call filter_commit,$(feature_pattern),$(changes_file)) || echo " NONE"

## fixes: show fix changes
fixes: $(changes_file)
	@$(call filter_commit,$(fix_pattern),$(changes_file)) || echo " NONE"

## doc: show doc changes
doc: $(changes_file)
	@$(call filter_commit,$(doc_pattern),$(changes_file)) || echo " NONE"

## chore: show chore changes
chore: $(changes_file)
	@$(call filter_commit,$(chore_pattern),$(changes_file)) || echo " NONE"

## refactor: show refactor changes
refactor: $(changes_file)
	@$(call filter_commit,$(refactor_pattern),$(changes_file)) || echo " NONE"

## test: show test changes
test: $(changes_file)
	@$(call filter_commit,$(test_pattern),$(changes_file)) || echo " NONE"

## improvements: show improvements changes (chore or refactor)
improvements: $(changes_file)
	@$(call filter_commit,$(improvements_pattern),$(changes_file)) || echo " NONE"

$(annotation_file): $(changes_file)
	@echo "The following changes are part of this tag: " >> $(annotation_file)
	@echo >> $(annotation_file)
	@$(call print_commits,"Features:",$(feature_pattern),$(changes_file),$(annotation_file))
	@$(call print_commits,"Fixes:",$(fix_pattern),$(changes_file),$(annotation_file))
	@$(call print_commits,"Docs:",$(doc_pattern),$(changes_file),$(annotation_file))
	@$(call print_commits,"Improvements:",$(improvements_pattern),$(changes_file),$(annotation_file))

## annotation: print annotation for tag
annotation: $(annotation_file)
	@cat $(annotation_file)
