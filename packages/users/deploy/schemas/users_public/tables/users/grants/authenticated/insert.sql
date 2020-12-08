-- Deploy: schemas/users_public/tables/users/grants/authenticated/insert to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/users/table

BEGIN;
GRANT INSERT ON TABLE "users_public".users TO authenticated;
COMMIT;
