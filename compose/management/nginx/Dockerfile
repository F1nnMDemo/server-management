FROM openresty/openresty:alpine-fat

# Install inotify to autoreload nginx-config on changes
RUN apk update
RUN apk add inotify-tools

# link the nginx config in
RUN rm -r /etc/nginx/conf.d
RUN ln -s /gitdeploy/compose/management/nginx/conf.d /etc/nginx/conf.d

COPY ./nginxReloader.sh /usr/local/openresty/bin/nginxReloader.sh
COPY ./docker-entrypoint.sh /usr/local/openresty/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/openresty/bin/nginxReloader.sh
RUN chmod +x /usr/local/openresty/bin/docker-entrypoint.sh

ENTRYPOINT [ "/usr/local/openresty/bin/docker-entrypoint.sh" ]
CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]