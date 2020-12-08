-- Deploy: schemas/users_public/tables/emails/columns/id/alterations/alt0000000036 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/emails/table
-- requires: schemas/users_public/tables/emails/columns/id/column

BEGIN;

ALTER TABLE "users_public".emails 
    ALTER COLUMN id SET NOT NULL;
COMMIT;
