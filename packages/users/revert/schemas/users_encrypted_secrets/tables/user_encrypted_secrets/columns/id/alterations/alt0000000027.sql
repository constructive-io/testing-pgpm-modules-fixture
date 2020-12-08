-- Revert: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/columns/id/alterations/alt0000000027 from pg

BEGIN;


ALTER TABLE "users_encrypted_secrets".user_encrypted_secrets 
    ALTER COLUMN id DROP DEFAULT;

COMMIT;  

