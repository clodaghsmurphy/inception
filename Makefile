all:
	mkdir -p /home/clmurphy/data/wordpress
	mkdir -p /home/clmurphy/data/mariadb
	sudo docker build -t nginx ./srcs/requirements/nginx
	sudo docker build -t wordpress ./srcs/requirements/wordpress
	sudo docker-compose -f ./srcs/docker-compose.yml  up -d --build
stop:
	sudo docker-compose -f ./srcs/docker-compose.yml down 

erase:
	sudo rm -rf ~/data/wordpress/*
	sudo rm -rf ~/data/mariadb/*