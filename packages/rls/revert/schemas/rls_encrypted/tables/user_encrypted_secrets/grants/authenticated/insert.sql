-- Revert: schemas/rls_encrypted/tables/user_encrypted_secrets/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "rls_encrypted".user_encrypted_secrets FROM authenticated;
COMMIT;  

