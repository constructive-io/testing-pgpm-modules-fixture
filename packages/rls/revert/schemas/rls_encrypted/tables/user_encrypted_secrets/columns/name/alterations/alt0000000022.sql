-- Revert: schemas/rls_encrypted/tables/user_encrypted_secrets/columns/name/alterations/alt0000000022 from pg

BEGIN;


ALTER TABLE "rls_encrypted".user_encrypted_secrets 
    ALTER COLUMN name DROP NOT NULL;


COMMIT;  

