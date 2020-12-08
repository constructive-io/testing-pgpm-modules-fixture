-- Revert: schemas/users_private/tables/api_tokens/columns/access_token/alterations/alt0000000021 from pg

BEGIN;


ALTER TABLE "users_private".api_tokens 
    ALTER COLUMN access_token DROP DEFAULT;

COMMIT;  

