FROM mysql:8.0.32

ENV MYSQL_ROOT_PASSWORD=root

COPY f1db.sql.gz /docker-entrypoint-initdb.d/
RUN gzip -d /docker-entrypoint-initdb.d/f1db.sql.gz