.DEFAULT_GOAL := help

contexts_path = $(word 1,$(dir $(realpath $(MAKEFILE_LIST))))
export base_path = $(realpath $(contexts_path)/../)
setup_folder = $(lastword $(shell echo $(contexts_path) | tr "/" " "))

CONTEXTS = $(shell find . -type f -name "Makefile" | grep ".*contexts/.*/Makefile" | cut -d/ -f3- | sed -E "s/\/Makefile//")
CONTEXTS_TASKS = $(sort $(addsuffix /%,$(CONTEXTS)))
CONTEXTS_HELP = $(sort $(addsuffix /help,$(CONTEXTS)))
CONTEXTS_DESCRIPTION = $(sort $(addsuffix /description,$(CONTEXTS)))

DEST_ERROR = $(error "Destination folder was not defined. Use 'dest="base_folder_for_context"' to point to where the contexts are")

.PHONY: help $(CONTEXTS) $(CONTEXTS_HELP) $(CONTEXTS_DESCRIPTION) how_to

$(CONTEXTS_TASKS):
	@$(MAKE) $(@F) -C $(setup_folder)/$(@D)/

$(CONTEXTS):
	@$(MAKE) -C $(setup_folder)/$@

$(CONTEXTS_HELP) $(CONTEXTS_DESCRIPTION):
	@$(MAKE) $(@F) -C $(setup_folder)/$(@D)/

help: $(CONTEXTS_HELP) how_to
contexts: $(CONTEXTS_DESCRIPTION) how_to

how_to:
	@echo
	@echo "How to run tasks:"
	@echo " - 'make {context}' (ex.:'make git')\t\t\t\t\truns default tasks in a context"
	@echo " - 'make {context}/{task}' (ex.: 'make todo/all')\t\t\truns a specific task inside a context"
	@echo " - 'make {context}/{subcontext}/{task}' (ex.: 'make test/unit/ruby')\truns a specific task inside a sub-context"
	@echo

## setup_makefile: symlink this Makefile into project home
setup_makefile: $(base_path)/Makefile

$(base_path)/Makefile:
	@ln -sfv $(word 1,$(abspath $(MAKEFILE_LIST))) $(base_path)/Makefile

context = $(shell echo $@ | sed -E "s/^setup_context\///")
## setup_context: copy context's Makefile locally
setup_context/%: 
	$(if ${dest},,${DEST_ERROR})
	@(curl https://raw.githubusercontent.com/jvortmann/make-contexts/master/contexts/$(context)/Makefile -o /tmp/contexts/$(context)/Makefile -f --create-dirs 2>/dev/null \
			&& mkdir -p $(dest)/contexts/$(context)/ 2>&1 >/dev/null \
			&& mv /tmp/contexts/$(context)/Makefile $(dest)/contexts/$(context)/Makefile 2>&1 >/dev/null \
			&& echo "Context downloaded to $(dest)/contexts/$(context)/" \
			|| echo "Context not found") \
		&& rm -r /tmp/contexts/$(context) 2>&1 >/dev/null \
