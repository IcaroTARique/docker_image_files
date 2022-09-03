FROM mysql:8.0
LABEL author="Ícaro Targino"
RUN chown -R mysql:mysql /var/lib/mysql
#COPY ./volume  /docker-entrypoint-initdb.d