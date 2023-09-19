FROM nginx:latest

RUN rm -rf /usr/share/nginx/html/index.html
COPY website/* /usr/share/nginx/html/
