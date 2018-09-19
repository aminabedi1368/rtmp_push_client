FROM registry.docker-cn.com/library/ubuntu:latest

MAINTAINER amin abedi <amin.abedi.1368@gmail.com>

RUN apt-get update \
    && apt-get install -y \
        nginx \
        ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log
RUN rm -v /etc/nginx/nginx.conf

# Add our custom configuration file to replace the original one
ADD nginx.conf /etc/nginx/

EXPOSE 80 443
RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install wget
RUN apt-get -y install nodejs
RUN apt-get -y install npm
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]


