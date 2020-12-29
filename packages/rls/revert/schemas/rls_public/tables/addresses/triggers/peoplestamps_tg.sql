-- Revert: schemas/rls_public/tables/addresses/triggers/peoplestamps_tg from pg

BEGIN;


ALTER TABLE "rls_public".addresses DROP COLUMN created_by;
ALTER TABLE "rls_public".addresses DROP COLUMN updated_by;

DROP TRIGGER peoplestamps_tg
ON "rls_public".addresses;


COMMIT;  

