-- Revert: schemas/users_encrypted_secrets/grants/usage/anonymous from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "users_encrypted_secrets"
FROM anonymous;

COMMIT;  

