-- Revert: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/policies/enable_row_level_security from pg

BEGIN;


ALTER TABLE "users_encrypted_secrets".user_encrypted_secrets
    DISABLE ROW LEVEL SECURITY;

COMMIT;  

