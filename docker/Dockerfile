FROM openjdk:8u131-jdk-alpine

MAINTAINER tl
#更新Alpine的软件源为国内
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories

RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash \
        bash-doc \
        bash-completion \
        && rm -rf /var/cache/apk/* \
        && /bin/bash
		
RUN mkdir /data

WORKDIR /data

EXPOSE 80

CMD ["/bin/bash","start.sh"]


