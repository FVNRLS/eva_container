name = linux_for_eva

# start the Docker Compose services using the configuration
all:
	@printf "Starting configuration ${name}...\n"
	@docker-compose up

# rebuild the Docker images and starting the services
build:
	@printf "Building configuration ${name}...\n"
	@docker-compose -f ./docker-compose.yml up --build

# stop and remove the containers, networks, and volumes created by the up 
down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./docker-compose.yml down

# deletes unused containers, networks, images and volumes 
clean: down
	@printf "Deleting configuration ${name}...\n"
	@docker system prune -a --force
	@rm -rf ./eva_data/*

re: clean build

# removes all docker configurations - full cleanup
fclean: clean
	@printf "Deleting all docker configurations...\n"
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY : all build down re clean fclean