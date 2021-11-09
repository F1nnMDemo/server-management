FROM f1nnm/openresty-easy-ssl:release-0.2.1

# link the nginx config in
RUN ln -s /gitdeploy/compose/nginx/build/locations.conf /etc/nginx/conf.d/locations.conf

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]