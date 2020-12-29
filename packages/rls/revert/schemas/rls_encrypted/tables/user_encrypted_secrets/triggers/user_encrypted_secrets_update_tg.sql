-- Revert: schemas/rls_encrypted/tables/user_encrypted_secrets/triggers/user_encrypted_secrets_update_tg from pg

BEGIN;


DROP TRIGGER user_encrypted_secrets_update_tg
    ON "rls_encrypted".user_encrypted_secrets;
COMMIT;  

