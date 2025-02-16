FROM nginx:1.19.0

WORKDIR /app
COPY server.c ./

# USER yellinja

RUN apt-get update \
&& apt-get install -y gcc spawn-fcgi libfcgi-dev \
&& gcc ./server.c -l fcgi -o ./server \
&& rm -rf /var/lib/apt/lists/

EXPOSE 81

HEALTHCHECK --timeout=10s CMD curl localhost:80/status

CMD spawn-fcgi -p 8080 ./server && nginx -g 'daemon off;' 
