-- Deploy: schemas/rls_public/tables/user_profiles/triggers/peoplestamps_tg to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_public/schema
-- requires: schemas/rls_public/tables/user_profiles/table

BEGIN;

ALTER TABLE "rls_public".user_profiles ADD COLUMN created_by UUID;
ALTER TABLE "rls_public".user_profiles ADD COLUMN updated_by UUID;
CREATE TRIGGER peoplestamps_tg
BEFORE UPDATE OR INSERT ON "rls_public".user_profiles
FOR EACH ROW
EXECUTE PROCEDURE stamps.peoplestamps();
COMMIT;
