-- Revert: schemas/users_public/grants/usage/authenticated from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "users_public"
FROM authenticated;

COMMIT;  

