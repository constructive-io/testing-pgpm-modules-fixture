-- Deploy: schemas/users_public/tables/users/columns/type/alterations/alt0000000008 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/users/table
-- requires: schemas/users_public/tables/users/columns/type/column

BEGIN;

ALTER TABLE "users_public".users 
    ALTER COLUMN type SET DEFAULT 0;
COMMIT;
