-- Revert: schemas/users_simple_secrets/tables/user_secrets/columns/owner_id/column from pg

BEGIN;


ALTER TABLE "users_simple_secrets".user_secrets DROP COLUMN owner_id;
COMMIT;  

