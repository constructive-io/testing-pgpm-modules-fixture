-- Revert: schemas/rls_encrypted/tables/user_encrypted_secrets/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "rls_encrypted".user_encrypted_secrets FROM authenticated;
COMMIT;  

