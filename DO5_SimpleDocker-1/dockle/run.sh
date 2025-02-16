#!/bin/bash

docker build . -t my_serv:v1
sleep 2
docker run -v $(pwd)/nginx/:/etc/nginx/ -d -p 80:81 my_serv:v1
sleep 2
dockle -ak NGINX_GPGKEY -i CIS-DI-0010 -t 5m my_serv:v1
