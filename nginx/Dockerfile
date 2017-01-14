FROM nginx
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.old
ADD php.conf /etc/nginx/conf.d/
CMD ["nginx", "-g", "daemon off;"]