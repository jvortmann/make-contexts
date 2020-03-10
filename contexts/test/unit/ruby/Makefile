-include ../../../prerequisites/tasks.mk
-include ../../../prerequisites/ruby.mk

base_path = $(abspath ../../../../)

##>> run unit tests for ruby

.DEFAULT_GOAL := ruby
.PHONY: ruby ruby_parallel

export RAILS_ENV=test

## all (default): run ruby unit tests
all: bundle
	@cd $(base_path) && bundle exec rspec spec --format Fuubar

## parallel: run ruby unit tests in parallel using 'knapsack'
parallel: bundle
	@cd $(base_path) && bundle exec rake parallel_tests:generate_rspec_knapsack_file knapsack:rspec
