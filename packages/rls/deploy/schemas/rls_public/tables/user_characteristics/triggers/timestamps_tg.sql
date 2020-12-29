-- Deploy: schemas/rls_public/tables/user_characteristics/triggers/timestamps_tg to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_public/schema
-- requires: schemas/rls_public/tables/user_characteristics/table

BEGIN;

ALTER TABLE "rls_public".user_characteristics ADD COLUMN created_at TIMESTAMPTZ;
ALTER TABLE "rls_public".user_characteristics ALTER COLUMN created_at SET DEFAULT NOW();
ALTER TABLE "rls_public".user_characteristics ADD COLUMN updated_at TIMESTAMPTZ;
ALTER TABLE "rls_public".user_characteristics ALTER COLUMN updated_at SET DEFAULT NOW();
CREATE TRIGGER timestamps_tg
BEFORE UPDATE OR INSERT ON "rls_public".user_characteristics
FOR EACH ROW
EXECUTE PROCEDURE stamps.timestamps();
COMMIT;
