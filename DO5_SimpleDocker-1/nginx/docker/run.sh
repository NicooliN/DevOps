#!/bin/bash

docker build . -t my_serv
sleep 2
docker run -v $(pwd)/nginx/:/etc/nginx/ -d -p 80:81 my_serv
