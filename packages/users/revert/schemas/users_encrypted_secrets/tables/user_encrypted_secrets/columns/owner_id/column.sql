-- Revert: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/columns/owner_id/column from pg

BEGIN;


ALTER TABLE "users_encrypted_secrets".user_encrypted_secrets DROP COLUMN owner_id;
COMMIT;  

