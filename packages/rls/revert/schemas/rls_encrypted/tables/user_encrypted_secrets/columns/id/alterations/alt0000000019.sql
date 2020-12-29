-- Revert: schemas/rls_encrypted/tables/user_encrypted_secrets/columns/id/alterations/alt0000000019 from pg

BEGIN;


ALTER TABLE "rls_encrypted".user_encrypted_secrets 
    ALTER COLUMN id DROP NOT NULL;


COMMIT;  

