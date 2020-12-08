-- Deploy: schemas/users_private/tables/api_tokens/columns/user_id/alterations/alt0000000019 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_private/schema
-- requires: schemas/users_private/tables/api_tokens/table
-- requires: schemas/users_private/tables/api_tokens/columns/user_id/column

BEGIN;

ALTER TABLE "users_private".api_tokens 
    ALTER COLUMN user_id SET NOT NULL;
COMMIT;
