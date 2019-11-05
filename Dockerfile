FROM node:8.11-alpine
MAINTAINER "Mahesh" "mahesh@ilimi.in"
RUN apk update \
    && apk add unzip \
    && apk add curl \
    && adduser -u 1001 -h /home/sunbird/ -D sunbird \
    && apk add --update ca-certificates  \
    && apk add --update ca-certificates openssl
USER sunbird
ENV HTTP_PROXY "http://172.22.218.218:8085"
ENV HTTPS_PROXY "http://172.22.218.218:8085"
ENV NO_PROXY "localhost,igx.mindtree.com,172.22.219.125,172.22.219.126,172.22.219.127,172.22.219.128,172.22.219.129,172.22.219.130,172.22.219.131,172.22.219.132,172.22.219.133,172.22.219.134,github.com"
ENV http_proxy "http://172.22.218.218:8085"
ENV https_proxy "http://172.22.218.218:8085"
ENV no_proxy "localhost,igx.mindtree.com,172.22.219.125,172.22.219.126,172.22.219.127,172.22.219.128,172.22.219.129,172.22.219.130,172.22.219.131,172.22.219.132,172.22.219.133,172.22.219.134,github.com"
RUN mkdir -p /home/sunbird/telemetry
WORKDIR /home/sunbird/telemetry
COPY ./telemetry-service.zip  /home/sunbird/telemetry/
RUN unzip /home/sunbird/telemetry/telemetry-service.zip
RUN ls -all /home/sunbird/telemetry
WORKDIR /home/sunbird/telemetry/telemetry/
CMD ["node", "app.js", "&"]
