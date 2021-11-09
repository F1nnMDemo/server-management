FROM f1nnm/openresty-easy-ssl:release-0.1.0

# link the nginx config in
RUN rm -r /etc/nginx/conf.d
RUN ln -s /gitdeploy/compose/management/nginx/conf.d /etc/nginx/conf.d

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]