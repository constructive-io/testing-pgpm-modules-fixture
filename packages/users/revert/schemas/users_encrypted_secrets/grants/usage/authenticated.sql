-- Revert: schemas/users_encrypted_secrets/grants/usage/authenticated from pg

BEGIN;


REVOKE USAGE
ON SCHEMA "users_encrypted_secrets"
FROM authenticated;

COMMIT;  

