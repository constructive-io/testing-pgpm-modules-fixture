-- Deploy: schemas/users_public/tables/emails/columns/email/alterations/alt0000000039 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/emails/table
-- requires: schemas/users_public/tables/emails/columns/email/column

BEGIN;

ALTER TABLE "users_public".emails 
    ALTER COLUMN email SET NOT NULL;
COMMIT;
