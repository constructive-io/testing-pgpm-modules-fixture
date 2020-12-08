-- Deploy: schemas/users_public/tables/emails/policies/enable_row_level_security to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/emails/table

BEGIN;

ALTER TABLE "users_public".emails
    ENABLE ROW LEVEL SECURITY;
COMMIT;
