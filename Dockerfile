FROM openresty/openresty:jessie
USER root
RUN luarocks install luajson
RUN luarocks install lua-cjson
RUN luarocks install luasocket
RUN luarocks install --server=http://luarocks.org/manifests/moesif lua-resty-moesif
