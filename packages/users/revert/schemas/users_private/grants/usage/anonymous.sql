-- Revert: schemas/users_private/grants/usage/anonymous from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "users_private"
FROM anonymous;

COMMIT;  

