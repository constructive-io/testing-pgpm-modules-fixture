-- Deploy: schemas/users_public/tables/emails/columns/owner_id/alterations/alt0000000038 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/emails/table
-- requires: schemas/users_public/tables/emails/columns/owner_id/column

BEGIN;

ALTER TABLE "users_public".emails 
    ALTER COLUMN owner_id SET NOT NULL;
COMMIT;
