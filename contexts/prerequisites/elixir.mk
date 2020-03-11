.PHONY: mix

mix:
	@cd $(base_path) && mix local.hex --force
	@cd $(base_path) && mix local.rebar --force
	@cd $(base_path) && mix deps.get
