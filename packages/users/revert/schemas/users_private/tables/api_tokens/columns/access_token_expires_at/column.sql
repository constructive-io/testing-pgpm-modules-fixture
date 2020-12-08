-- Revert: schemas/users_private/tables/api_tokens/columns/access_token_expires_at/column from pg

BEGIN;


ALTER TABLE "users_private".api_tokens DROP COLUMN access_token_expires_at;
COMMIT;  

