-- Deploy: schemas/users_private/tables/api_tokens/alterations/alt0000000016 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_private/schema
-- requires: schemas/users_private/tables/api_tokens/table

BEGIN;

ALTER TABLE "users_private".api_tokens
    DISABLE ROW LEVEL SECURITY;
COMMIT;
