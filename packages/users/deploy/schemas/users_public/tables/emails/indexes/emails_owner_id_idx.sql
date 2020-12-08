-- Deploy: schemas/users_public/tables/emails/indexes/emails_owner_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/emails/table

BEGIN;

CREATE INDEX emails_owner_id_idx ON "users_public".emails (owner_id);
COMMIT;
