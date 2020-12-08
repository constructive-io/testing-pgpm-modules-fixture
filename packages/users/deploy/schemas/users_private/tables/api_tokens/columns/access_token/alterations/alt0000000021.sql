-- Deploy: schemas/users_private/tables/api_tokens/columns/access_token/alterations/alt0000000021 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_private/schema
-- requires: schemas/users_private/tables/api_tokens/table
-- requires: schemas/users_private/tables/api_tokens/columns/access_token/column

BEGIN;

ALTER TABLE "users_private".api_tokens 
    ALTER COLUMN access_token SET DEFAULT encode( gen_random_bytes( 48 ), 'hex' );
COMMIT;
