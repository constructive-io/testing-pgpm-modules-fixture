-- Deploy: schemas/users_public/tables/emails/constraints/emails_email_key to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/emails/table

BEGIN;

ALTER TABLE "users_public".emails
    ADD CONSTRAINT emails_email_key UNIQUE (email);
COMMIT;
