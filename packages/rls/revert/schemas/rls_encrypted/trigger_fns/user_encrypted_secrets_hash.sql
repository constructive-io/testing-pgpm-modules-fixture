-- Revert: schemas/rls_encrypted/trigger_fns/user_encrypted_secrets_hash from pg

BEGIN;


DROP FUNCTION "rls_encrypted".user_encrypted_secrets_hash;
COMMIT;  

