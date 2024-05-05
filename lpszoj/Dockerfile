FROM nginx:stable-alpine3.19-slim

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
&& sed -i 's/#http/http/g' /etc/apk/repositories \
&& apk update && apk upgrade \
&& apk add bash wget openrc \
&& openrc \
&& touch /run/openrc/softlevel


COPY ./insta*.sh /root/
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
#RUN bash /root/install.sh

ENTRYPOINT ["/docker-entrypoint.sh"]


# 定义容器启动时执行的命令
#CMD ["nginx"]