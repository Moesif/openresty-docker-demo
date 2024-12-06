FROM openresty/openresty:focal
USER root
RUN apt-get update && \
    apt-get install -y git zlib1g-dev gcc
RUN luarocks install lua-resty-jwt
RUN luarocks install --server=http://luarocks.org/manifests/moesif lua-resty-moesif
