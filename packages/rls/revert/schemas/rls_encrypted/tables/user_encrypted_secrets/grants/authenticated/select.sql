-- Revert: schemas/rls_encrypted/tables/user_encrypted_secrets/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "rls_encrypted".user_encrypted_secrets FROM authenticated;
COMMIT;  

