FROM openresty/openresty:jessie
USER root
RUN luarocks install --server=http://luarocks.org/manifests/moesif lua-resty-moesif
