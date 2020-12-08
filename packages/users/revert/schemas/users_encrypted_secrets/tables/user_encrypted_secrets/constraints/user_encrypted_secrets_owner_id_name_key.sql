-- Revert: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/constraints/user_encrypted_secrets_owner_id_name_key from pg

BEGIN;


ALTER TABLE "users_encrypted_secrets".user_encrypted_secrets 
    DROP CONSTRAINT user_encrypted_secrets_owner_id_name_key;

COMMIT;  

