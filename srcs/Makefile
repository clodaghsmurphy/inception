all:
	mkdir -p /home/clmurphy/data/wordpress
	mkdir -p /home/clmurphy/data/mariadb
	sudo docker build -t nginx ./requirements/nginx
	sudo docker build -t wordpress ./requirements/wordpress
	sudo docker-compose up -d
stop:
	sudo docker-compose down