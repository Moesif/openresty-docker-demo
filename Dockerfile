FROM openresty/openresty:jessie
RUN luarocks install luajson
RUN luarocks install lua-cjson
RUN luarocks install luasocket
RUN opm get Moesif/lua-resty-moesif
