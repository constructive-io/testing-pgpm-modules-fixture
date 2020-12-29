-- Revert: schemas/rls_encrypted/procedures/get/procedure from pg

BEGIN;


DROP FUNCTION "rls_encrypted".get;
COMMIT;  

