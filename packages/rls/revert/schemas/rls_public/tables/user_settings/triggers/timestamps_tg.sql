-- Revert: schemas/rls_public/tables/user_settings/triggers/timestamps_tg from pg

BEGIN;


ALTER TABLE "rls_public".user_settings DROP COLUMN created_at;
ALTER TABLE "rls_public".user_settings DROP COLUMN updated_at;

DROP TRIGGER timestamps_tg ON "rls_public".user_settings;

COMMIT;  

