
DO
$do$
BEGIN

    IF NOT EXISTS (
        SELECT FROM pg_catalog.pg_roles 
        WHERE  rolname = 'metabase') THEN
        CREATE USER metabase WITH
            LOGIN 
            PASSWORD 'metabase';
    END IF;

    IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'metabase') THEN
        CREATE DATABASE metabase OWNER metabase;
    END IF;


    GRANT CREATE ON DATABASE metabase TO metabase;
    GRANT CREATE ON SCHEMA public TO metabase;

    IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'metabase') THEN
        CREATE DATABASE metabase OWNER metabase;
    END IF;

    IF NOT EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'metastar') THEN
        EXECUTE 'CREATE SCHEMA metastar';
    END IF;
    


END
$do$;