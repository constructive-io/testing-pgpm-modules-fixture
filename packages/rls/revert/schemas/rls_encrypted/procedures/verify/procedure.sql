-- Revert: schemas/rls_encrypted/procedures/verify/procedure from pg

BEGIN;


DROP FUNCTION "rls_encrypted".verify;
COMMIT;  

