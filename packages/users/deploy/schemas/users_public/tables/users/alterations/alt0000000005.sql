-- Deploy: schemas/users_public/tables/users/alterations/alt0000000005 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/users/table

BEGIN;

ALTER TABLE "users_public".users
    DISABLE ROW LEVEL SECURITY;
COMMIT;
