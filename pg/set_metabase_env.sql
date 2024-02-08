
DO
$do$
BEGIN
    --- CRIAR USUARIO metabase para o METABASE ACESSAR OS SCHEMAS, DEFININDO SUPERUSER POIS SEM ISSO ELE NÃO TEM ACESSO AS TABELAS
    IF NOT EXISTS (
        SELECT FROM pg_catalog.pg_roles 
        WHERE  rolname = 'metabase') THEN
        CREATE USER metabase WITH
            LOGIN
            SUPERUSER
            PASSWORD 'metabase';
    END IF;

    --- CRIA BANCO DE DADOS metabase
    IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'metabase') THEN
        CREATE DATABASE metabase OWNER metabase;
    END IF;

    --- CRIA SCHEMA PARA SALVAR O MODELO ESTRELA
    IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'star_schema') THEN
        EXECUTE 'CREATE SCHEMA star_schema';
    END IF;
END
$do$;