-- Deploy: schemas/users_encrypted_secrets/grants/usage/authenticated to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_encrypted_secrets/schema

BEGIN;

GRANT USAGE
ON SCHEMA "users_encrypted_secrets"
TO authenticated;
COMMIT;
