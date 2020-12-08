-- Deploy: schemas/users_private/grants/usage/anonymous to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_private/schema

BEGIN;

GRANT USAGE
ON SCHEMA "users_private"
TO anonymous;
COMMIT;
