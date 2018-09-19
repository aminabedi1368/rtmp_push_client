FROM registry.docker-cn.com/library/alpine:3.2
RUN apk add --update nginx && rm -rf /var/cache/apk/*
RUN mkdir -p /tmp/nginx/client-body

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY website /usr/share/nginx/html
RUN apt-get update
RUN apt-get install curl
RUN apt-get install nodejs
CMD ["nginx", "-g", "daemon off;"]
