FROM postgres:latest
COPY ./seeds/*.sql /docker-entrypoint-initdb.d/
RUN echo 'BANCO DE DADOS DO METABASE E TABELA DE TESTE CRIADAS!'