-- Revert: schemas/users_public/grants/usage/anonymous from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "users_public"
FROM anonymous;

COMMIT;  

