FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./www /www

EXPOSE 80
CMD ["nginx"]