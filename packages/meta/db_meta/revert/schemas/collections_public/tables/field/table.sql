
BEGIN;

DROP INDEX field_database_id_idx;
DROP INDEX field_table_id_idx;
DROP TABLE collections_public.field;

COMMIT;
