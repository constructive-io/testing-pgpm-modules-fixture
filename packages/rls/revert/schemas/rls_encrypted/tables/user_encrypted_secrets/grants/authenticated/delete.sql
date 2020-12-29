-- Revert: schemas/rls_encrypted/tables/user_encrypted_secrets/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "rls_encrypted".user_encrypted_secrets FROM authenticated;
COMMIT;  

