-- Revert: schemas/users_simple_secrets/grants/usage/authenticated from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "users_simple_secrets"
FROM authenticated;

COMMIT;  

