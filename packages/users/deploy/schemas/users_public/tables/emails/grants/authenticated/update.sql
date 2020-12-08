-- Deploy: schemas/users_public/tables/emails/grants/authenticated/update to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/emails/table

BEGIN;
GRANT UPDATE ON TABLE "users_public".emails TO authenticated;
COMMIT;
