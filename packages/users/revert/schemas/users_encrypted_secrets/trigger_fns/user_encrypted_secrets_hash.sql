-- Revert: schemas/users_encrypted_secrets/trigger_fns/user_encrypted_secrets_hash from pg

BEGIN;


DROP FUNCTION "users_encrypted_secrets".user_encrypted_secrets_hash;
COMMIT;  

