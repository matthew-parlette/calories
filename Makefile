.ONESHELL:
SHELL = /bin/bash

help:
		@echo "Targets:"
		@echo "  dev     : Start a development server locally"
		@echo "  gems    : Install gems"
		@echo "  migrate : Create and migrate development database"
		@echo "  create  : Create development database"
		@echo "  reset   : Rebuild development database"
		@echo "  seed    : Seed the database"

create:
		@echo "Creating database..."
		@rake db:create

migrate: create
		@echo "Migrating database..."
		@rake db:migrate

gems:
		@echo "Installing gems..."
		@bundle install

dev development: migrate gems
		@echo "Starting dev server..."
		@bin/rails s

test: gems
		@echo "Running tests..."
		@bin/rails test

reset:
		@echo "Dropping database..."
		@rake db:drop
		$(MAKE) migrate
		$(MAKE) seed

seed:
		@echo "Seeding database..."
		@rake db:seed
