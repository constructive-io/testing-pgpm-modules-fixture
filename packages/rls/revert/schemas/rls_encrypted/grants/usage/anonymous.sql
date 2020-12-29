-- Revert: schemas/rls_encrypted/grants/usage/anonymous from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "rls_encrypted"
FROM anonymous;

COMMIT;  

