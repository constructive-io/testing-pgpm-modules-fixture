-- Deploy: schemas/users_public/alterations/alt0000000042 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema

BEGIN;
COMMENT ON CONSTRAINT emails_owner_id_fkey ON "users_public".emails IS NULL;
COMMIT;
