-- Deploy: schemas/rls_public/tables/user_settings/triggers/peoplestamps_tg to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_public/schema
-- requires: schemas/rls_public/tables/user_settings/table

BEGIN;

ALTER TABLE "rls_public".user_settings ADD COLUMN created_by UUID;
ALTER TABLE "rls_public".user_settings ADD COLUMN updated_by UUID;
CREATE TRIGGER peoplestamps_tg
BEFORE UPDATE OR INSERT ON "rls_public".user_settings
FOR EACH ROW
EXECUTE PROCEDURE stamps.peoplestamps();
COMMIT;
