-- Deploy: schemas/users_simple_secrets/grants/usage/authenticated to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_simple_secrets/schema

BEGIN;

GRANT USAGE
ON SCHEMA "users_simple_secrets"
TO authenticated;
COMMIT;
