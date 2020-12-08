-- Deploy: schemas/users_public/tables/users/columns/type/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/users/table

BEGIN;

ALTER TABLE "users_public".users ADD COLUMN type int;
COMMIT;
