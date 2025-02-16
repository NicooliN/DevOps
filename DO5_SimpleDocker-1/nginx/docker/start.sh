#!/bin/bash
spawn-fcgi -p 8080 /usr/local/bin/my_server
nginx -g 'daemon off;'

