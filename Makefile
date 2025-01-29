all : up

up : 
	@docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

restart : 
	@docker-compose -f ./srcs/docker-compose.yml restart

logs : 
	@docker-compose -f ./srcs/docker-compose.yml logs -f

status : 
	@docker ps