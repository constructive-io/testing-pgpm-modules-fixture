-- Deploy: schemas/users_public/tables/users/policies/enable_row_level_security to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/users/table

BEGIN;

ALTER TABLE "users_public".users
    ENABLE ROW LEVEL SECURITY;
COMMIT;
