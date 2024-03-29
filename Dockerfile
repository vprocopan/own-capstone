FROM ubuntu:18.04

RUN apt-get update && apt-get install --no-install-recommends -y nginx=1.14.0-0ubuntu1.9 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./www /www

EXPOSE 80
CMD ["nginx"]