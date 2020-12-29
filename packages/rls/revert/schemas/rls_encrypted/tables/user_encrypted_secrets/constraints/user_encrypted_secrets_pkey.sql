-- Revert: schemas/rls_encrypted/tables/user_encrypted_secrets/constraints/user_encrypted_secrets_pkey from pg

BEGIN;


ALTER TABLE "rls_encrypted".user_encrypted_secrets 
    DROP CONSTRAINT user_encrypted_secrets_pkey;

COMMIT;  

