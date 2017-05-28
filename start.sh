#!/bin/bash
# Restart docker & stop existing  services
# sudo service apache2 restart
# sudo service mysql restart
sudo service docker restart
# Delete all containers
sudo docker rm $(sudo docker ps -a -q)
# Delete all images
sudo docker rmi $(sudo docker images -q)

sudo docker-compose build &
sudo docker-compose up &

sudo docker run -v /var/www/sql:/sql --link dockertests_database_1:mysql -it arey/mysql-client -h mysql -ppassword -D mysite -e "source /sql/export.sql" &

cd atom1.17.1

sudo docker build -t test/rvv .
sudo xhost +
sudo docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY test/rvv &

