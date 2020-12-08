-- Deploy: schemas/users_public/tables/emails/alterations/alt0000000035 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/emails/table

BEGIN;

ALTER TABLE "users_public".emails
    DISABLE ROW LEVEL SECURITY;
COMMIT;
