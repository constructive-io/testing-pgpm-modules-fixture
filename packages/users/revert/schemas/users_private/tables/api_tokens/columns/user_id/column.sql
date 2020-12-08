-- Revert: schemas/users_private/tables/api_tokens/columns/user_id/column from pg

BEGIN;


ALTER TABLE "users_private".api_tokens DROP COLUMN user_id;
COMMIT;  

