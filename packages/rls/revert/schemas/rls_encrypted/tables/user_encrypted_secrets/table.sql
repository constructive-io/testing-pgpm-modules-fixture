-- Revert: schemas/rls_encrypted/tables/user_encrypted_secrets/table from pg

BEGIN;
DROP TABLE "rls_encrypted".user_encrypted_secrets;
COMMIT;  

