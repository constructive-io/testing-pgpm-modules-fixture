-- Revert: schemas/rls_encrypted/procedures/del/procedure from pg

BEGIN;


DROP FUNCTION "rls_encrypted".del;
COMMIT;  

