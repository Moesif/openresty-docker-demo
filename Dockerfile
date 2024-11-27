FROM openresty/openresty:focal
USER root
RUN luarocks install lua-resty-jwt
RUN luarocks install --server=http://luarocks.org/manifests/moesif lua-resty-moesif
