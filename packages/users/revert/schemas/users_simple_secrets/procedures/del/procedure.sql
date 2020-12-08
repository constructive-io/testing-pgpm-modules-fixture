-- Revert: schemas/users_simple_secrets/procedures/del/procedure from pg

BEGIN;


DROP FUNCTION "users_simple_secrets".del;
COMMIT;  

