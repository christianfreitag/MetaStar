

DO
$do$
BEGIN

    INSERT INTO public.metabase_database
    (id, 
    created_at, 
    updated_at, 
    "name", 
    description, 
    details, 
    engine, 
    is_sample, 
    is_full_sync, 
    points_of_interest, 
    caveats, 
    metadata_sync_schedule, 
    cache_field_values_schedule, 
    timezone, 
    is_on_demand, 
    auto_run_queries, 
    refingerprint, 
    cache_ttl, 
    initial_sync_status, 
    creator_id, 
    settings, 
    dbms_version, 
    is_audit)
    VALUES(2, 
    '2024-02-05 17:58:42.872', 
    '2024-02-05 18:01:34.381', 
    'metastar', 
    NULL, 
    '{"ssl":false,"password":"metabase","port":5432,"advanced-options":false,"schema-filters-type":"inclusion","schema-filters-patterns":"metastar","dbname":"metabase","host":"postgres","tunnel-enabled":false,"user":"metabase"}', 'postgres', false, true, NULL, NULL, '0 28 * * * ? *', '0 0 16 * * ? *', 'GMT', false, true, NULL, NULL, 'complete', 1, NULL, '{"flavor":"PostgreSQL","version":"16.1 (Debian 16.1-1.pgdg120+1)","semantic-version":[16,1]}', false);
    
END
$do$;