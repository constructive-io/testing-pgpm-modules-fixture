-- Deploy: schemas/users_public/tables/emails/columns/is_verified/alterations/alt0000000041 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/emails/table
-- requires: schemas/users_public/tables/emails/columns/is_verified/column

BEGIN;

ALTER TABLE "users_public".emails 
    ALTER COLUMN is_verified SET DEFAULT false;
COMMIT;
