all : up

up : 
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@sudo docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@sudo docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@sudo docker-compose -f ./srcs/docker-compose.yml start

restart : 
	@sudo docker-compose -f ./srcs/docker-compose.yml restart

logs : 
	@sudo docker-compose -f ./srcs/docker-compose.yml logs -f

status : 
	@sudo docker ps