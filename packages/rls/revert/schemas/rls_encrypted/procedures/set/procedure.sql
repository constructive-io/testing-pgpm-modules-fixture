-- Revert: schemas/rls_encrypted/procedures/set/procedure from pg

BEGIN;


DROP FUNCTION "rls_encrypted".set;
COMMIT;  

