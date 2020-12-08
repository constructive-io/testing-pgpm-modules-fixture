-- Deploy: schemas/users_public/grants/usage/anonymous to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema

BEGIN;

GRANT USAGE
ON SCHEMA "users_public"
TO anonymous;
COMMIT;
