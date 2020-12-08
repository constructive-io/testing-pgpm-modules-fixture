-- Revert: schemas/users_private/tables/api_tokens/table from pg

BEGIN;
DROP TABLE "users_private".api_tokens;
COMMIT;  

