-- Revert: schemas/rls_encrypted/tables/user_encrypted_secrets/columns/owner_id/alterations/alt0000000021 from pg

BEGIN;


ALTER TABLE "rls_encrypted".user_encrypted_secrets 
    ALTER COLUMN owner_id DROP NOT NULL;


COMMIT;  

