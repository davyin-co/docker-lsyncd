FROM lsiobase/alpine:3.19

RUN apk add --no-cache lsyncd openssh-client

RUN apk add --no-cache lua5.3 lua5.3-dev luarocks && \
    luarocks install crontab
    
COPY root/ /
RUN chmod +x /etc/services.d/lsyncd/run && \
    apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo Asia/Shanghai > /etc/timezone && \
    apk del tzdata
