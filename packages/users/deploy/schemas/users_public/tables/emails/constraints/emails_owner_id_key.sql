-- Deploy: schemas/users_public/tables/emails/constraints/emails_owner_id_key to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/emails/table

BEGIN;

ALTER TABLE "users_public".emails
    ADD CONSTRAINT emails_owner_id_key UNIQUE (owner_id);
COMMIT;
