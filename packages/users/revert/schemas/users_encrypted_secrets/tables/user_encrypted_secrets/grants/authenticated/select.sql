-- Revert: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "users_encrypted_secrets".user_encrypted_secrets FROM authenticated;
COMMIT;  

