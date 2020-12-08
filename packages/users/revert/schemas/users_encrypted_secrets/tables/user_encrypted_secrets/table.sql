-- Revert: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/table from pg

BEGIN;
DROP TABLE "users_encrypted_secrets".user_encrypted_secrets;
COMMIT;  

