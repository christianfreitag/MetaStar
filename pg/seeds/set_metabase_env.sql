
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
    IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'votacao_candidato') THEN
        EXECUTE 'CREATE SCHEMA votacao_candidato';
    END IF;

    --- CRIA TABELA DE TESTE PARA VISUALIZAR NO METABASE
    CREATE TABLE votacao_candidato.candidato_teste (id int primary key,nome varchar(200),partido varchar(10), votos int);
    INSERT INTO votacao_candidato.candidato_teste (id, nome, partido, votos)
    VALUES(1, 'José peixera', 'PT',21);
    INSERT INTO votacao_candidato.candidato_teste (id, nome, partido,votos)
    VALUES(2, 'maria', 'PSOL',1343);
    INSERT INTO votacao_candidato.candidato_teste (id, nome, partido,votos)
    VALUES(3, 'Lucas', 'PT',231);
    INSERT INTO votacao_candidato.candidato_teste (id, nome, partido,votos)
    VALUES(4, 'Pedro Ornesto', 'PSDB',2134);


END
$do$;
