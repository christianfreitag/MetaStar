INSERT INTO public.metabase_database
(id, created_at, updated_at, "name", description, details, engine, is_sample, is_full_sync, points_of_interest, caveats, 
metadata_sync_schedule, cache_field_values_schedule, timezone, is_on_demand, auto_run_queries, refingerprint, cache_ttl, 
initial_sync_status, creator_id, settings, dbms_version, is_audit)
VALUES(2, '2024-02-08 14:38:50.107', '2024-02-08 14:38:50.592', 'STAR SCHEMA', NULL, 
'{"ssl":false,"password":"metabase","port":5432,"advanced-options":false,"schema-filters-type":"inclusion",
"schema-filters-patterns":"star_schema","dbname":"metabase","host":"postgres","tunnel-enabled":false,"user":"metabase"}', '
postgres', false, true, NULL, NULL, '0 50 * * * ? *', '0 50 0 * * ? *', 'GMT', false, true, NULL, NULL, 'complete', 1, NULL, 
'{"flavor":"PostgreSQL","version":"16.1 (Debian 16.1-1.pgdg120+1)","semantic-version":[16,1]}', false);

