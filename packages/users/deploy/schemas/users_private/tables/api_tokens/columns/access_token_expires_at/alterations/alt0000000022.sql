-- Deploy: schemas/users_private/tables/api_tokens/columns/access_token_expires_at/alterations/alt0000000022 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_private/schema
-- requires: schemas/users_private/tables/api_tokens/table
-- requires: schemas/users_private/tables/api_tokens/columns/access_token_expires_at/column

BEGIN;

ALTER TABLE "users_private".api_tokens 
    ALTER COLUMN access_token_expires_at SET NOT NULL;
COMMIT;
