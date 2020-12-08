-- Revert: schemas/users_private/grants/usage/authenticated from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "users_private"
FROM authenticated;

COMMIT;  

