.ONESHELL:
SHELL = /bin/bash

help:
		@echo "Targets:"
		@echo "  dev     : Start a development server locally"
		@echo "  docker  : Build and run as a container"
		@echo "  run     : Build and run as a container"
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

docker run: build
		docker run --rm -ie RAILS_ENV=production -e SECRET_KEY_BASE=development -p 3000:3000 --name calories -t calories

build:
		docker build -t calories .
