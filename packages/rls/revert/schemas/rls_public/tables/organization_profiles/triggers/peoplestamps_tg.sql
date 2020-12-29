-- Revert: schemas/rls_public/tables/organization_profiles/triggers/peoplestamps_tg from pg

BEGIN;


ALTER TABLE "rls_public".organization_profiles DROP COLUMN created_by;
ALTER TABLE "rls_public".organization_profiles DROP COLUMN updated_by;

DROP TRIGGER peoplestamps_tg
ON "rls_public".organization_profiles;


COMMIT;  

