-- Revert: schemas/rls_encrypted/grants/usage/authenticated from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "rls_encrypted"
FROM authenticated;

COMMIT;  

