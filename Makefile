# Docker

build:
	docker-compose -f docker-compose.yaml build

up:
	docker-compose -f docker-compose.yaml up 

down:
	docker-compose -f docker-compose.yaml down

dbset:
	docker-compose run api rails db:environment:set RAILS_ENV=development

# Vue
yarninstall:
	docker-compose run front yarn install

lint:
	docker-compose run front yarn run lint

# Rails 
rails_init:
	make migratereset;
	make migrate;
	make seed
	
db_create:
	docker-compose run api rails db:create          

migrate:
	docker-compose run api rails db:migrate

migrate_test:
	docker-compose run api rails db:migrate RAILS_ENV=test

rollback:
	docker-compose run api rails db:rollback

migratereset:
	docker-compose run api rails db:migrate:reset

seed:
	docker-compose run api rails db:seed

seedreset:
	docker-compose run api rails db:reset

geminstall:
	docker-compose run api gem install

test: 
	docker-compose run api rspec -f d

