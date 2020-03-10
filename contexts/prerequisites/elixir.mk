.PHONY: mix

mix:
	@mix local.hex --force
	@mix local.rebar --force
	@mix deps.get
