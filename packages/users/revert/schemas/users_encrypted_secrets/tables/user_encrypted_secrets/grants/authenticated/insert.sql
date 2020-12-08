-- Revert: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "users_encrypted_secrets".user_encrypted_secrets FROM authenticated;
COMMIT;  

