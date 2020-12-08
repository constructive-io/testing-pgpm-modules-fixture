-- Revert: schemas/users_private/tables/api_tokens/columns/id/column from pg

BEGIN;


ALTER TABLE "users_private".api_tokens DROP COLUMN id;
COMMIT;  

