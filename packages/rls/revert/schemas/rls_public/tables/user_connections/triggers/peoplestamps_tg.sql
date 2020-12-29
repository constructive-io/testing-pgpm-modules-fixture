-- Revert: schemas/rls_public/tables/user_connections/triggers/peoplestamps_tg from pg

BEGIN;


ALTER TABLE "rls_public".user_connections DROP COLUMN created_by;
ALTER TABLE "rls_public".user_connections DROP COLUMN updated_by;

DROP TRIGGER peoplestamps_tg
ON "rls_public".user_connections;


COMMIT;  

