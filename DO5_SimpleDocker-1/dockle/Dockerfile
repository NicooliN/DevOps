FROM nginx:1.19.0

USER root

RUN apt-get update; \
    apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    rm -rf /var/lib/apt/lists/*; \
    groupadd -r appuser && useradd -r -g appuser appuser; \
    chmod u-s /bin/su; \
    chmod u-s /usr/bin/newgrp; \
    chmod u-s /usr/bin/passwd; \
    chmod u-s /usr/bin/gpasswd; \
    chmod u-s /bin/umount; \
    chmod u-s /usr/bin/chfn; \
    chmod u-s /usr/bin/chsh; \
    chmod u-s /bin/mount; \
    chmod g-s /usr/bin/expiry; \
    chmod g-s /usr/bin/chage; \
    chmod g-s /usr/bin/wall; \
    chmod g-s /sbin/unix_chkpwd; \
    chown -R appuser:appuser /etc/nginx/nginx.conf; \
    chown -R appuser:appuser /home/; \
    chown -R appuser:appuser /var/cache/nginx; \
    touch /var/run/nginx.pid; \
    chown appuser:appuser /var/run/nginx.pid; 
    
# RUN adduser -D appuser
USER appuser
COPY --chown=appuser:appuser ./server.c /home/appuser/server.c
COPY --chown=appuser:appuser  ./nginx/nginx.conf /etc/nginx/nginx.conf
USER appuser
RUN gcc -o /home/appuser/server /home/appuser/server.c -lfcgi 
USER appuser
RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx; \
 chown -R appuser:appuser /var/cache/nginx ; \
 chown -R appuser:appuser /var/run ; \
 chown -R appuser:appuser /var/log/nginx \
 chown -R appuser:appuser /var/run/nginx.pid; \
 find / -perm /6000 -type f -exec chmod a-s {} \; || true
 USER appuser
EXPOSE 80

USER appuser
HEALTHCHECK --timeout=10s CMD curl localhost:80/status
USER appuser
CMD spawn-fcgi -p 8080 /home/appuser/server && nginx -g 'daemon off;' 

