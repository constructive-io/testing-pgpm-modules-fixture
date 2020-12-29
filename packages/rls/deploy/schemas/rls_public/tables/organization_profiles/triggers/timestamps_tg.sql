-- Deploy: schemas/rls_public/tables/organization_profiles/triggers/timestamps_tg to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_public/schema
-- requires: schemas/rls_public/tables/organization_profiles/table

BEGIN;

ALTER TABLE "rls_public".organization_profiles ADD COLUMN created_at TIMESTAMPTZ;
ALTER TABLE "rls_public".organization_profiles ALTER COLUMN created_at SET DEFAULT NOW();
ALTER TABLE "rls_public".organization_profiles ADD COLUMN updated_at TIMESTAMPTZ;
ALTER TABLE "rls_public".organization_profiles ALTER COLUMN updated_at SET DEFAULT NOW();
CREATE TRIGGER timestamps_tg
BEFORE UPDATE OR INSERT ON "rls_public".organization_profiles
FOR EACH ROW
EXECUTE PROCEDURE stamps.timestamps();
COMMIT;
