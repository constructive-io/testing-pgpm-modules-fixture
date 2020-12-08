-- Revert: schemas/users_simple_secrets/tables/user_secrets/table from pg

BEGIN;
DROP TABLE "users_simple_secrets".user_secrets;
COMMIT;  

