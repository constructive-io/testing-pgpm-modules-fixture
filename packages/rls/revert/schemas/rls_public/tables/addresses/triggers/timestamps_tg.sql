-- Revert: schemas/rls_public/tables/addresses/triggers/timestamps_tg from pg

BEGIN;


ALTER TABLE "rls_public".addresses DROP COLUMN created_at;
ALTER TABLE "rls_public".addresses DROP COLUMN updated_at;

DROP TRIGGER timestamps_tg ON "rls_public".addresses;

COMMIT;  

