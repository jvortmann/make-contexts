.PHONY: mix

mix:
	@cd $(base_path) && mix local.hex --if-missing
	@cd $(base_path) && mix local.rebar --force
	@cd $(base_path) && mix deps.get
