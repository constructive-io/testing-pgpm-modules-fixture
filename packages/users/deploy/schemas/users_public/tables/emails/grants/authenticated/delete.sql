-- Deploy: schemas/users_public/tables/emails/grants/authenticated/delete to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/emails/table

BEGIN;
GRANT DELETE ON TABLE "users_public".emails TO authenticated;
COMMIT;
