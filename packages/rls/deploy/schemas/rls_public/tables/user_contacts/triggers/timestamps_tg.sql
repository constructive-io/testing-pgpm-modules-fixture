-- Deploy: schemas/rls_public/tables/user_contacts/triggers/timestamps_tg to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_public/schema
-- requires: schemas/rls_public/tables/user_contacts/table

BEGIN;

ALTER TABLE "rls_public".user_contacts ADD COLUMN created_at TIMESTAMPTZ;
ALTER TABLE "rls_public".user_contacts ALTER COLUMN created_at SET DEFAULT NOW();
ALTER TABLE "rls_public".user_contacts ADD COLUMN updated_at TIMESTAMPTZ;
ALTER TABLE "rls_public".user_contacts ALTER COLUMN updated_at SET DEFAULT NOW();
CREATE TRIGGER timestamps_tg
BEFORE UPDATE OR INSERT ON "rls_public".user_contacts
FOR EACH ROW
EXECUTE PROCEDURE stamps.timestamps();
COMMIT;
