-- Deploy: schemas/users_private/grants/usage/authenticated to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_private/schema

BEGIN;

GRANT USAGE
ON SCHEMA "users_private"
TO authenticated;
COMMIT;
