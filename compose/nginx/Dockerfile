FROM openresty/openresty:alpine-fat

# Install inotify to autoreload nginx-config on changes
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install inotify-tools -y

# link the nginx config in
RUN rm -r /etc/nginx/conf.d
RUN ln -s /gitdeploy/compose/management/nginx/conf.d /etc/nginx/conf.d

# install lua-resty-auto-ssl
RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-auto-ssl

# creating fallback certificates
RUN openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 \
      -subj '/CN=sni-support-required-for-valid-ssl' \
      -keyout /etc/ssl/resty-auto-ssl-fallback.key \
      -out /etc/ssl/resty-auto-ssl-fallback.crt

COPY ./nginxReloader.sh /usr/local/openresty/bin/nginxReloader.sh
COPY ./docker-entrypoint.sh /usr/local/openresty/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/openresty/bin/nginxReloader.sh
RUN chmod +x /usr/local/openresty/bin/docker-entrypoint.sh

ENTRYPOINT [ "/usr/local/openresty/bin/docker-entrypoint.sh" ]
CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]