-- Revert: schemas/users_encrypted_secrets/procedures/set/procedure from pg

BEGIN;


DROP FUNCTION "users_encrypted_secrets".set;
COMMIT;  

