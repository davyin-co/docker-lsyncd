FROM lsiobase/alpine:3.19

RUN apk add --no-cache lsyncd openssh-client git lua5.4 lua5.4-dev lua5.4-socket luarocks \
    && ln -s /usr/bin/luarocks-5.4 /usr/bin/luarocks

RUN luarocks install lua-crontab

RUN apk del git
    
COPY root/ /
RUN chmod +x /etc/services.d/lsyncd/run && \
    apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo Asia/Shanghai > /etc/timezone && \
    apk del tzdata
