FROM nginx:alpine

COPY ./nginxReloader.sh /app/nginxReloader.sh
COPY ./docker-entrypoint.sh /app/docker-entrypoint.sh

RUN chmod +x /app/nginxReloader.sh
RUN chmod +x /app/docker-entrypoint.sh

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install inotify-tools -y

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
CMD ["/app/openresty", "-g", "daemon off;"]