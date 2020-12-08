-- Revert: schemas/users_simple_secrets/grants/usage/anonymous from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "users_simple_secrets"
FROM anonymous;

COMMIT;  

