-- Revert: schemas/users_simple_secrets/procedures/set/procedure from pg

BEGIN;


DROP FUNCTION "users_simple_secrets".set;
COMMIT;  

