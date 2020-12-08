-- Revert: schemas/users_encrypted_secrets/procedures/get/procedure from pg

BEGIN;


DROP FUNCTION "users_encrypted_secrets".get;
COMMIT;  

