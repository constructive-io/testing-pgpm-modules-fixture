-- Revert: schemas/rls_encrypted/tables/user_encrypted_secrets/alterations/alt0000000018 from pg

BEGIN;


ALTER TABLE "rls_encrypted".user_encrypted_secrets
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

