-- Deploy: schemas/users_public/tables/users/columns/id/alterations/alt0000000006 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/users/table
-- requires: schemas/users_public/tables/users/columns/id/column

BEGIN;

ALTER TABLE "users_public".users 
    ALTER COLUMN id SET NOT NULL;
COMMIT;
