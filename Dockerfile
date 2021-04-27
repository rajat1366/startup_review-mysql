FROM mysql:latest
ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASE startupreviewdb  
ENV MYSQL _USER rajat
ENV MYSQL_PASSWORD 1234
ADD startupreviewdb.sql  /docker-entrypoint-initdb.d     
EXPOSE 3306

