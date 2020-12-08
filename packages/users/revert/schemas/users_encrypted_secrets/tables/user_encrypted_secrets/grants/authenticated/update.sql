-- Revert: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "users_encrypted_secrets".user_encrypted_secrets FROM authenticated;
COMMIT;  

