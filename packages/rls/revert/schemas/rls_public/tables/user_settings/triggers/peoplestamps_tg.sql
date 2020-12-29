-- Revert: schemas/rls_public/tables/user_settings/triggers/peoplestamps_tg from pg

BEGIN;


ALTER TABLE "rls_public".user_settings DROP COLUMN created_by;
ALTER TABLE "rls_public".user_settings DROP COLUMN updated_by;

DROP TRIGGER peoplestamps_tg
ON "rls_public".user_settings;


COMMIT;  

