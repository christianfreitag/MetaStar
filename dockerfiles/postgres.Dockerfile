FROM postgres:latest
COPY ../pg/*.sql /docker-entrypoint-initdb.d/
