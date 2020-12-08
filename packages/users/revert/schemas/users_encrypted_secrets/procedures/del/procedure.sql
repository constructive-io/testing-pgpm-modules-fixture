-- Revert: schemas/users_encrypted_secrets/procedures/del/procedure from pg

BEGIN;


DROP FUNCTION "users_encrypted_secrets".del;
COMMIT;  

