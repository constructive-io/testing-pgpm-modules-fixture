-- Revert: schemas/users_simple_secrets/procedures/get/procedure from pg

BEGIN;


DROP FUNCTION "users_simple_secrets".get;
COMMIT;  

