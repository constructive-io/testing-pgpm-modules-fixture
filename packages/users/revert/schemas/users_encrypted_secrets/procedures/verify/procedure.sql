-- Revert: schemas/users_encrypted_secrets/procedures/verify/procedure from pg

BEGIN;


DROP FUNCTION "users_encrypted_secrets".verify;
COMMIT;  

